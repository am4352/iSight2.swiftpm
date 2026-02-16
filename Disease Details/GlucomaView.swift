//
//  GlucomaView.swift
//  iSight
//
//  Created by Anuj   on 22/01/26.
//
import SwiftUI

struct GlucomaView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("Glucoma")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Glucoma")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Nearsightedness")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("What is Glucoma?")
                            .font(.headline)
                        
                        Text("Glaucoma is a group of eye conditions that damage the optic nerve, often due to increased pressure inside the eye (intraocular pressure or IOP), leading to gradual, irreversible vision loss, typically starting with peripheral vision, and is a leading cause of blindness.")
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
                        print("Starting 1Myopia AR experience")
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




