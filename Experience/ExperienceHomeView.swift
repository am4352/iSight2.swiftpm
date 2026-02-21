import SwiftUI

struct ExperienceHomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                VStack(alignment: .leading, spacing: 6) {
                    Text("iSight")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Lets See the World Through Their Eyes")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 8)

                ExperienceCard(
                    imageName: "Myopia",
                    title: "Myopia",
                    buttonTitle: "Experience"
                ) {
                    MyopiaView()
                }

                ExperienceCard(
                    imageName: "HyperMetropia",
                    title: "Hypermetropia",
                    buttonTitle: "Experience"
                ) {
                    HyperMetropiaView()
                }

                ExperienceCard(
                    imageName: "Glucoma",
                    title: "Glucoma",
                    buttonTitle: "Experience"
                ) {
                    GlucomaView1()
                }

                ExperienceCard(
                    imageName: "MacularDegeneration",
                    title: "Macular Degeneration",
                    buttonTitle: "Experience"
                ) {
                    GlucomaView()
                }

                ExperienceCard(
                    imageName: "Diabetes",
                    title: "Diabetic Retinopathy",
                    buttonTitle: "Experience"
                ) {
                    DiabeticView()
                }
            }
            .padding()
        }
    }
}

