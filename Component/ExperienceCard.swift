import SwiftUI

struct ExperienceCard: View {
    let imageName: String
    let title: String
    let buttonTitle: String
    let destination: AnyView
    
    @Environment(\.colorScheme) var colorScheme
    
    init<Destination: View>(
        imageName: String,
        title: String,
        buttonTitle: String = "Experience",
        @ViewBuilder destination: () -> Destination
    ) {
        self.imageName = imageName
        self.title = title
        self.buttonTitle = buttonTitle
        self.destination = AnyView(destination())
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 0) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)  // Adapts to light/dark mode
                    
                    Spacer()
                    
                    Text(buttonTitle)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding()
                .background(
                    colorScheme == .dark
                        ? Color(.systemGray6)  // Dark mode background
                        : Color(.systemBackground)  // Light mode background
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(
                color: colorScheme == .dark
                    ? .white.opacity(0.05)
                    : .black.opacity(0.12),
                radius: 5,
                y: 4
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

