import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {

            NavigationStack {
                ExperienceHomeView()
            }
            .tabItem {
                Label("Experience", systemImage: "camera.viewfinder")
            }

            NavigationStack {
                Text("Tips")
            }
            .tabItem {
                Label("Tips", systemImage: "heart.text.square")
            }

            NavigationStack {
                GuideHomeView()
            }
            .tabItem {
                Label("Guidance", systemImage: "person.2.fill")
            }
        }
    }
}

#Preview {
    RootView()
}

