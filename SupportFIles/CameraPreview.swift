//
//  CameraPreview.swift
//  iSight
//
//  Created by Anuj   on 23/01/26.
//
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var cameraManager: CameraManager
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        
        if let preview = cameraManager.preview {
            preview.frame = view.bounds
            preview.videoGravity = .resizeAspectFill
            view.layer.addSublayer(preview)
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let preview = cameraManager.preview {
            DispatchQueue.main.async {
                preview.frame = uiView.bounds
            }
        }
    }
}
