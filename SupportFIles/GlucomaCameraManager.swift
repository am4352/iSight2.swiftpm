//
//  GlucomaCameraManager.swift
//  iSight
//
//  Created by Anuj   on 27/01/26.
//

import ARKit
import AVFoundation
internal import Combine

class GlaucomaCameraManager: NSObject, ObservableObject {
    @Published var currentFrame: ARFrame?
    @Published var isSessionRunning = false
    
    var severity: CGFloat = 50
    
    private let session = ARSession()
    
    override init() {
        super.init()
        session.delegate = self
    }
    
    func startSession() {
        let config = ARWorldTrackingConfiguration()
        session.run(config, options: [.resetTracking, .removeExistingAnchors])
        
        DispatchQueue.main.async {
            self.isSessionRunning = true
            print("✅ Glaucoma AR Session started")
        }
    }
    
    func stopSession() {
        session.pause()
        isSessionRunning = false
    }
}

extension GlaucomaCameraManager: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        DispatchQueue.main.async {
            self.currentFrame = frame
        }
    }
}

