//
//  GlucomaRenderer.swift
//  iSight
//
//  Created by Anuj   on 27/01/26.
//

import ARKit
import CoreImage

class GlaucomaRenderer {
    
    private let ciContext = CIContext()
    
    func render(frame: ARFrame, severity: CGFloat) -> CIImage? {
        
        let cameraImage = CIImage(cvPixelBuffer: frame.capturedImage)
            .oriented(.right)
        
        let imageSize = cameraImage.extent
        
        // Create radial gradient mask
        // Center = white (clear vision)
        // Edges = black (vision loss)
        guard let gradientFilter = CIFilter(name: "CIRadialGradient") else {
            return cameraImage
        }
        
        let centerX = imageSize.width / 2
        let centerY = imageSize.height / 2
        
        // Adjust tunnel size based on severity
        // 0% severity = large clear area (mild glaucoma)
        // 100% severity = small clear area (severe glaucoma)
        let maxRadius = max(imageSize.width, imageSize.height)
        let innerRadius = maxRadius * (1.0 - severity / 100.0) * 0.6
        let outerRadius = maxRadius * 0.9
        
        gradientFilter.setValue(CIVector(x: centerX, y: centerY), forKey: "inputCenter")
        gradientFilter.setValue(innerRadius, forKey: "inputRadius0")
        gradientFilter.setValue(outerRadius, forKey: "inputRadius1")
        gradientFilter.setValue(CIColor.white, forKey: "inputColor0")
        gradientFilter.setValue(CIColor.black, forKey: "inputColor1")
        
        guard let gradientImage = gradientFilter.outputImage?.cropped(to: imageSize) else {
            return cameraImage
        }
        
        // Apply darkening to peripheral vision
        guard let darkenFilter = CIFilter(name: "CIBlendWithMask") else {
            return cameraImage
        }
        
        // Create dark overlay
        guard let colorFilter = CIFilter(name: "CIConstantColorGenerator") else {
            return cameraImage
        }
        
        colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0, alpha: 1), forKey: "inputColor")
        
        guard let darkOverlay = colorFilter.outputImage?.cropped(to: imageSize) else {
            return cameraImage
        }
        
        // Blend: camera image in center, dark at edges
        darkenFilter.setValue(cameraImage, forKey: kCIInputImageKey)
        darkenFilter.setValue(darkOverlay, forKey: kCIInputBackgroundImageKey)
        darkenFilter.setValue(gradientImage, forKey: kCIInputMaskImageKey)
        
        // Optional: Add slight blur to peripheral areas
        if severity > 30 {
            guard let blurredEdges = applyPeripheralBlur(
                image: darkenFilter.outputImage ?? cameraImage,
                mask: gradientImage,
                severity: severity
            ) else {
                return darkenFilter.outputImage
            }
            return blurredEdges
        }
        
        return darkenFilter.outputImage
    }
    
    private func applyPeripheralBlur(image: CIImage, mask: CIImage, severity: CGFloat) -> CIImage? {
        // Blur the entire image
        guard let blurFilter = CIFilter(name: "CIGaussianBlur") else {
            return image
        }
        
        let blurAmount = (severity / 100.0) * 20.0
        blurFilter.setValue(image, forKey: kCIInputImageKey)
        blurFilter.setValue(blurAmount, forKey: kCIInputRadiusKey)
        
        guard let blurredImage = blurFilter.outputImage else {
            return image
        }
        
        // Invert mask so edges are blurred, center is sharp
        let invertedMask = mask.applyingFilter("CIColorInvert")
        
        // Blend sharp center with blurred edges
        guard let blendFilter = CIFilter(name: "CIBlendWithMask") else {
            return image
        }
        
        blendFilter.setValue(image, forKey: kCIInputImageKey)
        blendFilter.setValue(blurredImage, forKey: kCIInputBackgroundImageKey)
        blendFilter.setValue(invertedMask, forKey: kCIInputMaskImageKey)
        
        return blendFilter.outputImage
    }
}


