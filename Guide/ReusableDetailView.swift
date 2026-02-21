//
//  ReusableDetailView.swift
//  iSight2
//
//  Created by Anuj   on 21/02/26.
//

import SwiftUI

struct ReusableDetailView: View {

    let content: GuideItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Title
                Text(content.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Subtitle
                Text(content.subtitle)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Hero image
                if let imageName = content.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    Image(systemName: content.icon)
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(Color.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Divider()

                // Description
                Text(content.description)
                    .font(.body)
                    .lineSpacing(4)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Divider()

                // Tips Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("How to Support")
                        .font(.headline)

                    ForEach(content.tips, id: \.self) { tip in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)

                            Text(tip)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(content.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
