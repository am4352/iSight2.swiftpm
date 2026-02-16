//
//  GuideDetailView.swift
//  iSight
//
//  Created by Anuj   on 01/02/26.
//

import SwiftUI
struct GuideDetailView: View {
    let guide: GuideItem
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: guide.icon)
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            Text(guide.title)
                .font(.largeTitle)
                .bold()
            
            Text("Details about \(guide.title) go here...")
                .foregroundColor(.secondary)
        }
        .padding()
        // This sets the small back button title on the previous page
        .navigationBarTitleDisplayMode(.inline)
    }
}

