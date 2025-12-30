import SwiftUI

struct EnvironmentImmersiveView: View {
    let environment: AppModel.Environment

    var body: some View {
        ZStack {
            environment.backgroundGradient.ignoresSafeArea()
            VStack(spacing: 24) {
                Image(systemName: environment.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white.opacity(0.8))
                Text(environment.rawValue)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                immersiveContent(for: environment)
            }
        }
    }

    @ViewBuilder
    private func immersiveContent(for environment: AppModel.Environment) -> some View {
        switch environment {
        case .office:
            Text("Welcome to the Office Environment!")
                .font(.title2)
                .foregroundColor(.white)
        case .nature:
            Text("Enjoy the Nature Environment!")
                .font(.title2)
                .foregroundColor(.white)
        case .space:
            Text("Explore the Space Environment!")
                .font(.title2)
                .foregroundColor(.white)
        case .cozy:
            Text("Relax in the Cozy Room!")
                .font(.title2)
                .foregroundColor(.white)
        case .minimal:
            Text("Minimal Environment")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}
