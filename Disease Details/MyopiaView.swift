//
//  MyopiaExperienceView.swift
//  iSight
//
//  Created by Anuj   on 21/01/26.
//
import SwiftUI

struct MyopiaView: View {
    
    @State private var showMyopiaEffect = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("MyopiaDetail")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Myopia")
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
                        print("testing")
                        showMyopiaEffect = true
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
                    .navigationDestination(isPresented: $showMyopiaEffect){
                        if #available(iOS 17.0, *) {
                            MyopicEffectView()
                        } else {
                            // Fallback on earlier versions
                        }
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
