import SwiftUI
import RealityKit
import AVFoundation
import RealityKitContent

struct SkyboxView: View {
	 @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

	 var body: some View {
		  ZStack {
				RealityView { content in
					 guard let dynamicSkybox = createDynamicSkybox() else { return }
					 content.add(dynamicSkybox)
					
					if let scene = try? await Entity(named: "christmasHouse", in: realityKitContentBundle) {
						 content.add(scene)
					}
				}
				.edgesIgnoringSafeArea(.all) // Make the immersive space fullscreen
				
				// Overlay a SwiftUI button to dismiss the immersive space
				VStack {
					 Spacer()
					 Button("Exit Immersive Space") {
						  Task {
								await dismissImmersiveSpace()
						  }
					 }
					 .buttonStyle(.borderedProminent)
					 .padding()
				}
		  }
	 }

	 private func createDynamicSkybox() -> Entity? {
		  // Mesh - large sphere
		  let skyBoxMesh = MeshResource.generateSphere(radius: 100000)
		  // Material - video material
		  guard let videoMaterial = createVideoMaterial() else { return nil }
		  
		  // Entity - return
		  let skyBoxEntity = ModelEntity(
				mesh: skyBoxMesh,
				materials: [videoMaterial]
		  )
		  
		  // Scaling to apply inner scale
		  skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)
		  
		  return skyBoxEntity
	 }

	 private func createVideoMaterial() -> VideoMaterial? {
		  // Video URL
		  guard let url = Bundle.main.url(forResource: "NightView", withExtension: "mp4") else {
				print("Error loading video")
				return nil
		  }
		  
		  // AVPlayer
		  let avPlayer = AVPlayer(url: url)
		  
		  // Return video material
		  let videoMaterial = VideoMaterial(avPlayer: avPlayer)
		 avPlayer.play()
		  return videoMaterial
	 }
}

#Preview {
	 SkyboxView()
}
