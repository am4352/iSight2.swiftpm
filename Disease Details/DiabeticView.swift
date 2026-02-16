//
//  DiabeticView.swift
//  iSight
//
//  Created by Anuj   on 22/01/26.
//

import SwiftUI

struct DiabeticView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("Glucoma")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Diabetic RetinoPathy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Nearsightedness")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("What is Myopia?")
                            .font(.headline)
                        
                        Text("Myopia, or nearsightedness, is a common vision condition where close objects appear clearly, but distant objects appear blurry. This occurs when the eye's shape causes light rays to focus in front of the retina instead of directly on it.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Common Symptoms")
                            .font(.headline)
                        
//                        VStack(alignment: .leading, spacing: 8) {
//                            SymptomRow(text: "Blurry vision when looking at distant objects")
//                            SymptomRow(text: "Squinting to see clearly")
//                            SymptomRow(text: "Eyestrain and headaches")
//                            SymptomRow(text: "Difficulty seeing while driving")
//                        }
                    }
                    
                    Divider()
                    
                    Button(action: {
                       
                    }) {
                        HStack {
                            Image(systemName: "camera.viewfinder")
                            Text("Start Camera Experience")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Myopia")
        .navigationBarTitleDisplayMode(.inline)
       // .toolbar(.hidden, for: .tabBar)
    }
}




