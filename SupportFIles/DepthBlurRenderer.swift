import ARKit
import CoreImage

final class DepthBlurRenderer {
    func render(frame: ARFrame, severity: CGFloat) -> CIImage? {
        return CIImage(cvPixelBuffer: frame.capturedImage)
            .oriented(.right)
    }
}

