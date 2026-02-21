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
    let imageName: String?
    let subtitle: String
    let description: String
    let tips: [String]
}

struct GuideHomeView: View {
    let guides = [
        GuideItem(
            title: "Respectful Assistance",
            icon: "hand.raised.fill",
            imageName: nil,
            subtitle: "Helping Without Overstepping",
            description: "Respectful assistance means offering help in a way that preserves the dignity and autonomy of the person you're supporting. Always ask before acting, and follow the person's lead rather than imposing your own assumptions about what they need.",
            tips: [
                "Always ask before offering physical help",
                "Wait for consent — don't grab, push, or steer",
                "Follow their lead, not your assumptions",
                "Respect their preferred way of doing things",
                "Offer once, then respect their decision"
            ]
        ),
        GuideItem(
            title: "Clear Communication",
            icon: "bubble.left.and.bubble.right.fill",
            imageName: nil,
            subtitle: "Communicating with Clarity & Care",
            description: "Clear communication involves being direct, patient, and considerate when interacting with someone who has a visual impairment. Verbal cues become essential when visual ones are unavailable, so be explicit and descriptive in your language.",
            tips: [
                "Introduce yourself by name when approaching",
                "Speak directly to the person, not to their companion",
                "Use specific directions like 'on your left' instead of 'over there'",
                "Announce when you're leaving the conversation",
                "Describe visual information verbally when relevant"
            ]
        ),
        GuideItem(
            title: "Safer & Thoughtful Spaces",
            icon: "shield.checkered",
            imageName: nil,
            subtitle: "Creating Accessible Environments",
            description: "Thoughtful spaces are designed with accessibility in mind — from clear pathways to consistent layouts. Small environmental details can make a huge difference in how comfortably and safely someone with a visual impairment can navigate and engage.",
            tips: [
                "Keep walkways and doorways clear of obstacles",
                "Don't rearrange furniture without informing everyone",
                "Use tactile markers or contrasting colors for edges and steps",
                "Ensure good, consistent lighting throughout spaces",
                "Place items back exactly where they were found"
            ]
        ),
        GuideItem(
            title: "Inclusive Technology & Design",
            icon: "desktopcomputer",
            imageName: nil,
            subtitle: "Designing for Everyone",
            description: "Inclusive technology ensures that digital products, apps, and devices are usable by everyone, regardless of ability. Designing with accessibility in mind from the start — not as an afterthought — leads to better experiences for all users.",
            tips: [
                "Support VoiceOver and other screen readers in your apps",
                "Use sufficient color contrast and scalable text",
                "Avoid relying only on color to convey meaning",
                "Add descriptive alt text to all images and icons",
                "Test your designs with real assistive technology users"
            ]
        ),
        GuideItem(
            title: "Language & Attitude",
            icon: "text.quote",
            imageName: nil,
            subtitle: "Words Shape Perception",
            description: "The words we use can either empower or diminish someone. Using respectful, person-first or identity-first language (as preferred by the individual) and avoiding pity-based narratives helps foster equality and mutual respect.",
            tips: [
                "Use 'person with a visual impairment' or their preferred term",
                "Avoid words like 'suffering from' or 'confined to'",
                "Don't describe someone as 'inspiring' just for living their life",
                "Treat them as equals — not as objects of pity or admiration",
                "Ask about their preferences rather than assuming"
            ]
        ),
        GuideItem(
            title: "Reflection Prompt",
            icon: "lightbulb.fill",
            imageName: nil,
            subtitle: "Pause, Think & Grow",
            description: "Reflection prompts encourage you to examine your own biases, assumptions, and behaviors. Taking a moment to reflect on how you interact with people who have disabilities can help you become a more empathetic and aware ally.",
            tips: [
                "Think about a time someone helped you without asking — how did it feel?",
                "Consider: do you treat people with disabilities differently?",
                "Reflect on assumptions you might unknowingly hold",
                "Ask yourself: am I helping for them, or for me?",
                "Commit to one change you can make starting today"
            ]
        )
    ]

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Assistance Guide")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Promote dignity over sympathy")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            GuideListView(guides: guides)
                .padding(.top, 10)
        }
        .padding()
    }
}

#Preview {
    RootView()
}
