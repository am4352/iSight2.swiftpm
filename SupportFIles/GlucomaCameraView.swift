//
//  GlucomaCameraView.swift
//  iSight
//
//  Created by Anuj   on 27/01/26.
//

import SwiftUI
import MetalKit

struct GlaucomaCameraView: UIViewRepresentable {
    var manager: GlaucomaCameraManager
    
    func makeUIView(context: Context) -> MTKView {
        let mtkView = MTKView()
        mtkView.device = MTLCreateSystemDefaultDevice()
        mtkView.delegate = context.coordinator
        mtkView.framebufferOnly = false
        mtkView.isPaused = false
        mtkView.enableSetNeedsDisplay = false
        mtkView.preferredFramesPerSecond = 60
        return mtkView
    }
    
    func updateUIView(_ uiView: MTKView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MTKViewDelegate {
        var parent: GlaucomaCameraView
        let commandQueue: MTLCommandQueue
        let ciContext: CIContext
        let renderer = GlaucomaRenderer()
        
        init(_ parent: GlaucomaCameraView) {
            self.parent = parent
            let device = MTLCreateSystemDefaultDevice()!
            self.commandQueue = device.makeCommandQueue()!
            self.ciContext = CIContext(mtlDevice: device)
            super.init()
        }
        
        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
        
        func draw(in view: MTKView) {
            guard let frame = parent.manager.currentFrame,
                  let drawable = view.currentDrawable,
                  let commandBuffer = commandQueue.makeCommandBuffer() else {
                return
            }
            
            guard let output = renderer.render(frame: frame, severity: parent.manager.severity) else {
                return
            }
            
            let scaleX = view.drawableSize.width / output.extent.width
            let scaleY = view.drawableSize.height / output.extent.height
            let scale = max(scaleX, scaleY)
            
            let scaledImage = output.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
            
            let originX = (view.drawableSize.width - scaledImage.extent.width) / 2
            let originY = (view.drawableSize.height - scaledImage.extent.height) / 2
            let centeredImage = scaledImage.transformed(by: CGAffineTransform(translationX: originX, y: originY))
            
            ciContext.render(centeredImage,
                           to: drawable.texture,
                           commandBuffer: commandBuffer,
                           bounds: CGRect(origin: .zero, size: view.drawableSize),
                           colorSpace: CGColorSpaceCreateDeviceRGB())
            
            commandBuffer.present(drawable)
            commandBuffer.commit()
        }
    }
}

