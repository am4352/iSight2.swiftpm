import ARKit
import AVFoundation
internal import Combine
import CoreImage

final class ARCameraManager: NSObject, ObservableObject {

    // 🔹 Single source of truth for UI
    @Published var outputImage: CIImage?
    @Published var isSessionRunning = false
    @Published var errorMessage: String?

    var severity: CGFloat = 40

    private let session = ARSession()
    private let renderer = DepthBlurRenderer()

    // Throttling
    private var lastFrameTime: CFTimeInterval = 0
    private let targetFPS: CFTimeInterval = 1.0 / 20.0 // 20 fps

    override init() {
        super.init()
        session.delegate = self
        print("🟢 ARCameraManager initialized")
    }

    // MARK: - Public control

    func startSession() {
        print("▶️ startSession() called")

        checkCameraAuthorization { [weak self] authorized in
            guard let self else { return }

            print("🔐 Camera authorization result: \(authorized)")

            guard authorized else {
                self.errorMessage = "Camera access denied. Enable it in Settings."
                print("❌ Camera access denied")
                return
            }

            self.startARSession()
        }
    }

    func stopSession() {
        print("⏹️ stopSession() called")
        session.pause()

        DispatchQueue.main.async {
            self.isSessionRunning = false
            self.outputImage = nil
        }
    }

    // MARK: - Private helpers

    private func startARSession() {
        print("🚀 Starting ARSession")

        let configuration = ARWorldTrackingConfiguration()

        if ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth) {
            configuration.frameSemantics.insert(.sceneDepth)
            print("✅ Scene depth supported and enabled")
        } else {
            print("⚠️ Scene depth NOT supported (fallback to camera only)")
        }

        session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

        DispatchQueue.main.async {
            self.isSessionRunning = true
            self.errorMessage = nil
            print("🟢 ARSession is running")
        }
    }

    private func checkCameraAuthorization(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        print("🔍 Camera authorization status: \(status.rawValue)")

        switch status {
        case .authorized:
            completion(true)

        case .notDetermined:
            print("❓ Requesting camera access")
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    print("🔐 Camera access granted: \(granted)")
                    completion(granted)
                }
            }

        case .denied, .restricted:
            completion(false)

        @unknown default:
            completion(false)
        }
    }
}

// MARK: - ARSessionDelegate

extension ARCameraManager: ARSessionDelegate {

    func session(_ session: ARSession, didUpdate frame: ARFrame) {

        print("📸 AR frame received")

        let now = CACurrentMediaTime()
        guard now - lastFrameTime >= targetFPS else {
            print("⏭️ Frame skipped (throttling)")
            return
        }
        lastFrameTime = now

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self else { return }

            let image = self.renderer.render(
                frame: frame,
                severity: self.severity
            ) ?? CIImage(cvPixelBuffer: frame.capturedImage).oriented(.right)

            DispatchQueue.main.async {
                self.outputImage = image
                print("🖼️ Output image published")
            }
        }
    }

    func session(_ session: ARSession, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
            self.isSessionRunning = false
            print("❌ ARSession failed: \(error.localizedDescription)")
        }
    }

    func sessionWasInterrupted(_ session: ARSession) {
        DispatchQueue.main.async {
            self.isSessionRunning = false
            print("⏸️ ARSession interrupted")
        }
    }

    func sessionInterruptionEnded(_ session: ARSession) {
        print("🔄 ARSession interruption ended, restarting")
        startARSession()
    }
}

