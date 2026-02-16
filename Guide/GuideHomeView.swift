//
//  GuideHomePage.swift
//  iSight
//
//  Created by Anuj   on 31/01/26.
//
import SwiftUI
struct GuideItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}


struct GuideHomeView: View {
    let guides = [
            GuideItem(title: "Visual Impairment", icon: "eye.slash"),
            GuideItem(title: "Color Blindness", icon: "paintpalette"),
            GuideItem(title: "Low Vision", icon: "eyeglasses")
        ]
    var body: some View {
        NavigationStack{
            VStack(spacing: 20)
            {
                VStack(alignment: .leading , spacing: 6)
                {
                    Text("Assistance Guide")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Promote Dignity Over Sympathy")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                List(guides) { guide in
                    NavigationLink(destination:  GuideDetailView(guide: guide))
                    {
                        HStack{
                            Text(guide.title)
                            Spacer()
                        }
                    }
                }
                
                
            }
            .padding()
        }
        
        NavigationStack{
           
            
        }
    }
}
#Preview {
    RootView()
}






