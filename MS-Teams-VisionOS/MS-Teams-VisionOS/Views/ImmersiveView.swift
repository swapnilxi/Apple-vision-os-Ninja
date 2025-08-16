import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @Environment(AppModel.self) private var appModel
    let exitImmersive: () -> Void
    
    var body: some View {
        ZStack {
            // Dynamic background based on selected environment
            environmentBackground
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Environment indicator
                VStack(spacing: 10) {
                    Image(systemName: appModel.selectedEnvironment.icon)
                        .font(.system(size: 60))
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                    
                    Text("\(appModel.selectedEnvironment.rawValue) Environment")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .padding(.top, 100)
                
                Spacer()
                
                // Controls
                VStack(spacing: 20) {
                    Text("Immersive Experience")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                    
                    Text("Enjoy your \(appModel.selectedEnvironment.rawValue.lowercased()) workspace")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.8))
                        .shadow(radius: 5)
                    
                    Button("Back to 2D Window") {
                        exitImmersive()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .shadow(radius: 10)
                }
                .padding(.bottom, 100)
            }
        }
        .animation(.easeInOut(duration: 1.0), value: appModel.selectedEnvironment)
    }
    
    @ViewBuilder
    private var environmentBackground: some View {
        switch appModel.selectedEnvironment {
        case .office:
            // Professional office environment
            RadialGradient(
                colors: [
                    Color.blue.opacity(0.6),
                    Color.gray.opacity(0.4),
                    Color.black.opacity(0.8)
                ],
                center: .center,
                startRadius: 100,
                endRadius: 800
            )
            .overlay(
                // Subtle grid pattern for office feel
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.05), Color.clear],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            
        case .nature:
            // Natural environment
            RadialGradient(
                colors: [
                    Color.green.opacity(0.7),
                    Color.mint.opacity(0.5),
                    Color.teal.opacity(0.3),
                    Color.black.opacity(0.6)
                ],
                center: .center,
                startRadius: 150,
                endRadius: 1000
            )
            .overlay(
                // Organic flowing patterns
                EllipticalGradient(
                    colors: [Color.green.opacity(0.2), Color.clear],
                    center: .topTrailing,
                    startRadiusFraction: 0.1,
                    endRadiusFraction: 0.8
                )
            )
            
        case .space:
            // Space environment
            RadialGradient(
                colors: [
                    Color.purple.opacity(0.8),
                    Color.blue.opacity(0.6),
                    Color.black,
                    Color.black
                ],
                center: .center,
                startRadius: 50,
                endRadius: 1200
            )
            .overlay(
                // Stars effect
                ForEach(0..<50, id: \.self) { _ in
                    Circle()
                        .fill(Color.white.opacity(Double.random(in: 0.3...1.0)))
                        .frame(width: Double.random(in: 1...3))
                        .position(
                            x: Double.random(in: 0...1000),
                            y: Double.random(in: 0...800)
                        )
                }
            )
            
        case .cozy:
            // Warm, cozy environment
            RadialGradient(
                colors: [
                    Color.orange.opacity(0.6),
                    Color.yellow.opacity(0.4),
                    Color.red.opacity(0.3),
                    Color.brown.opacity(0.5)
                ],
                center: .center,
                startRadius: 100,
                endRadius: 900
            )
            .overlay(
                // Warm glow effect
                EllipticalGradient(
                    colors: [Color.orange.opacity(0.3), Color.clear],
                    center: .bottomLeading,
                    startRadiusFraction: 0.2,
                    endRadiusFraction: 1.0
                )
            )
            
        case .minimal:
            // Clean, minimal environment
            LinearGradient(
                colors: [
                    Color.white.opacity(0.1),
                    Color.gray.opacity(0.05),
                    Color.black.opacity(0.3)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .overlay(
                // Subtle geometric patterns
                Rectangle()
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.1), Color.clear],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(45))
                    .opacity(0.3)
            )
        }
    }
}
