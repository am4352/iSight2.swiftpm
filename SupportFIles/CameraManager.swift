//
//  CameraManager.swift
//  iSight
//
//  Created by Anuj   on 23/01/26.
//
import AVFoundation
import SwiftUI
internal import Combine

class CameraManager: NSObject, ObservableObject {
    @Published var permissionGranted = false
    @Published var session = AVCaptureSession()
    @Published var output = AVCaptureVideoDataOutput()
    @Published var preview: AVCaptureVideoPreviewLayer?
    
    override init() {
        super.init()
        checkPermission()
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            permissionGranted = true
            setupCamera()
        case .notDetermined:
            requestPermission()
        default:
            permissionGranted = false
        }
    }
    
    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
            DispatchQueue.main.async {
                self?.permissionGranted = granted
                if granted {
                    self?.setupCamera()
                }
            }
        }
    }
    
    func setupCamera() {
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("No camera available")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            if session.canAddInput(input) {
                session.addInput(input)
            }
            
            if session.canAddOutput(output) {
                session.addOutput(output)
            }
            
            preview = AVCaptureVideoPreviewLayer(session: session)
            preview?.videoGravity = .resizeAspectFill
            
        } catch {
            print("Error setting up camera: \(error.localizedDescription)")
        }
    }
    
    func startSession() {
        if !session.isRunning {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                self?.session.startRunning()
            }
        }
    }
    
    func stopSession() {
        if session.isRunning {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                self?.session.stopRunning()
            }
        }
    }
}
