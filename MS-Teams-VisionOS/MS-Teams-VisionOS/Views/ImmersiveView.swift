import SwiftUI

struct ImmersiveView: View {
    let exitImmersive: () -> Void
    var body: some View {
        VStack {
            Text("Immersive Space")
                .font(.largeTitle)
                .padding(.top, 40)
            Button("Back to 2D Window", action: exitImmersive)
                .padding()
        }
    }
}


