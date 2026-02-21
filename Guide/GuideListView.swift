//
//  GuideListView.swift
//  iSight2
//
//  Created by Anuj   on 21/02/26.


import SwiftUI
struct GuideListView: View {
    let guides: [GuideItem]

    var body: some View {
        List(guides) { guide in
            NavigationLink(destination: GuideDetailView(guide: guide)) {
                HStack(spacing: 12) {
                    Image(systemName: guide.icon)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(width: 28)

                    Text(guide.title)
                }
            }
        }
        .listStyle(.plain)
    }
}
