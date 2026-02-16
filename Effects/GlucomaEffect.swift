//
//  GlucomaEffect.swift
//  iSight
//
//  Created by Anuj   on 27/01/26.
//

import SwiftUI

struct GlucomaEffectView: View {
    @StateObject private var cameraManager = GlaucomaCameraManager()
    @State private var severity: CGFloat = 50
    
    private var severityColor: Color {
        switch severity {
        case 0..<20: return .green
        case 20..<40: return .yellow
        case 40..<60: return .orange
        case 60..<80: return .red
        default: return .purple
        }
    }
    
    var body: some View {
        ZStack {
            GlaucomaCameraView(manager: cameraManager)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Glaucoma Simulation")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "eye.trianglebadge.exclamationmark")
                            .foregroundColor(.orange)
                        Text("Tunnel Vision Effect")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Slider(value: $severity, in: 0...100)
                        .tint(severityColor)
                        .onChange(of: severity) { _, newValue in
                            cameraManager.severity = newValue
                        }
                    
                    Text("\(Int(severity))%")
                        .font(.title2).bold().monospacedDigit()
                        .foregroundColor(.white)
                    
                    HStack(spacing: 12) {
                        PresetButton(title: "Normal", value: 0, currentValue: $severity)
                        PresetButton(title: "Mild", value: 30, currentValue: $severity)
                        PresetButton(title: "Moderate", value: 60, currentValue: $severity)
                        PresetButton(title: "Severe", value: 90, currentValue: $severity)
                    }
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

struct PresetButton: View {
    let title: String
    let value: CGFloat
    @Binding var currentValue: CGFloat
    
    var isSelected: Bool {
        abs(currentValue - value) < 5
    }
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3)) {
                currentValue = value
            }
        }) {
            Text(title)
                .font(.caption)
                .fontWeight(isSelected ? .bold : .medium)
                .foregroundColor(isSelected ? .white : .white.opacity(0.7))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.blue : Color.white.opacity(0.2))
                )
        }
    }
}




