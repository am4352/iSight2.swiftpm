//
//  CameraRenderView.swift
//  iSight
//
//  Created by Anuj   on 27/01/26.
//
import SwiftUI
import CoreImage

struct CameraRenderView: View {

    @StateObject private var manager = ARCameraManager()
    private let ciContext = CIContext()

    var body: some View {
        ZStack {
            if let image = manager.outputImage,
               let cgImage = ciContext.createCGImage(image, from: image.extent) {

                Image(decorative: cgImage, scale: 1.0)
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
        }
        .onAppear {
            print("👀 CameraRenderView appeared")
            manager.startSession()
        }
        .onDisappear {
            manager.stopSession()
        }
    }
}

#Preview {
    CameraRenderView()
}

