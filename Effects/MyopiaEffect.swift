import SwiftUI
import ARKit

@available(iOS 17.0, *)
struct MyopicEffectView: View {
    @StateObject private var cameraManager = ARCameraManager()
    @State private var severity: CGFloat = 60

    private var isLiDARSupported: Bool {
        ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth)
    }

    private var severityColor: Color {
        switch severity {
        case 0..<20: return .green
        case 20..<40: return .yellow
        case 40..<60: return .orange
        case 60..<80: return .red
        default: return .purple
        }
    }

    @available(iOS 17.0, *)
    @available(iOS 17.0, *)
    var body: some View {
        ZStack {

            // ✅ CAMERA RENDERING (NO ARCameraView)
            if let image = cameraManager.outputImage {
                Image(uiImage: UIImage(ciImage: image))
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Color.black
                    .ignoresSafeArea()
                    .overlay(
                        Text("Starting camera…")
                            .foregroundColor(.white)
                    )
            }

            // UI Overlay
            VStack {
                Spacer()

                VStack(spacing: 20) {
                    Text("Myopia Simulation")
                        .font(.headline)
                        .foregroundColor(.white)

                    HStack(spacing: 6) {
                        Image(systemName: "sensor.fill")
                            .foregroundColor(isLiDARSupported ? .green : .red)
                        Text(isLiDARSupported ? "LiDAR Active" : "Depth Fallback")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.8))
                    }

                    if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    };if #available(iOS 17.0, *) {
                        Slider(value: $severity, in: 0...100)
                            .tint(severityColor)
                            .onChange(of: severity) { _, newValue in
                                cameraManager.severity = newValue
                            }
                    } else {
                        // Fallback on earlier versions
                    }

                    Text("\(Int(severity))%")
                        .font(.title2.bold())
                        .monospacedDigit()
                        .foregroundColor(.white)

//                    HStack(spacing: 12) {
//                        PresetButton(title: "Normal", value: 0, currentValue: $severity)
//                        PresetButton(title: "Mild", value: 30, currentValue: $severity)
//                        PresetButton(title: "Moderate", value: 60, currentValue: $severity)
//                        PresetButton(title: "Severe", value: 90, currentValue: $severity)
//                    }
                }
                .padding(24)
                .background(.ultraThinMaterial)
                .cornerRadius(28)
                .padding()
            }
        }
        .onAppear {
            cameraManager.severity = severity
            cameraManager.startSession()
        }
        .onDisappear {
            cameraManager.stopSession()
        }
    }
}

