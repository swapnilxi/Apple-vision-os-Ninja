//
//  LessonView.swift
//  LearningOS
//
//  Created by Abundent on 28/01/25.
//

import SwiftUI
import RealityKit

struct LessonView: View {
		 @Environment(ViewModel.self) private var model
		 @Environment(\.openWindow) private var openWindow
		 @Environment(\.dismissWindow) private var dismissWindow
		 @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
		 
		 var body: some View {
			  @Bindable var model = model
			  
			  VStack {
					
					// Navigation Overlay
					NavigationStack(path: $model.navigationPath) {
						 HUDNavigationContent()
							  .padding()
							  .background(.ultraThinMaterial)
							  .cornerRadius(16)
							  .padding(.top, 40)
					}
					.frame(width: 400)
			  }
			  .onChange(of: model.navigationPath, handleNavigation)
		 }
		 
		private func createModernCard(title: String) -> ModelEntity {
			 let cardSize = SIMD3<Float>(0.8, 1.2, 0.02) // X, Y, thickness
			 
			 // Create base card with rounded edges using box mesh
			 let cardMesh = MeshResource.generateBox(
				  size: cardSize,
				  cornerRadius: 0.05 // This is the key parameter for rounded corners
			 )
			 
			 // Glass material with blur effect
			 let material = UnlitMaterial(
				  color: .init(
						red: 1.0,
						green: 1.0,
						blue: 1.0,
						alpha: 0.2 // Transparency for glass effect
				  )
			 )
			 
			 let card = ModelEntity(mesh: cardMesh, materials: [material])
			 
			 // Add subtle border
			 let border = ModelEntity(
				  mesh: MeshResource.generateBox(size: [cardSize.x + 0.02, cardSize.y + 0.02, cardSize.z + 0.001]),
				  materials: [SimpleMaterial(color: .white.withAlphaComponent(0.3), isMetallic: false)]
			 )
			 card.addChild(border)
			 
			 // Create text label
			 let textEntity = createGlassTextEntity(
				  text: title,
				  fontSize: 0.15,
				  color: .white.withAlphaComponent(0.9),
				  position: SIMD3(0, 0.4, cardSize.z/2 + 0.001)
			 )
			 card.addChild(textEntity)
			
			 return card
		}
		 
		 private func createGlassTextEntity(text: String, fontSize: Float, color: UIColor, position: SIMD3<Float>) -> ModelEntity {
			  let textMesh = MeshResource.generateText(
					text,
					extrusionDepth: 0.01,
					font: .systemFont(ofSize: CGFloat(fontSize)),
					containerFrame: .zero,
					alignment: .center,
					lineBreakMode: .byTruncatingTail
			  )
			  
			  let textMaterial = UnlitMaterial(
					color: color
			  )
			  
			  let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
			  textEntity.position = position
			  return textEntity
		 }
		 
		 @ViewBuilder
		 private func HUDNavigationContent() -> some View {
			  VStack(spacing: 16) {
					Text("Available Courses")
						 .font(.title.bold())
						 .foregroundStyle(.white)
					
					Divider()
						 .background(.white.opacity(0.5))
					
					ForEach(Module.allCases, id: \.self) { module in
						 NavigationLink(value: module) {
							  Text(module.name)
									.foregroundStyle(.white)
									.padding()
									.frame(maxWidth: .infinity)
						 }
						 .background(.white.opacity(0.1))
						 .cornerRadius(8)
					}
			  }
			  .padding()
			  .navigationDestination(for: Module.self) { module in
					Text("Viewing \(module.name)")
						 .foregroundStyle(.white)
			  }
		 }
		 
		 private func handleNavigation(oldPath: [Module], newPath: [Module]) {
			  if newPath.isEmpty {
					// Handle dismissal logic
			  }
		 }
	}



#Preview {
	LessonView()
		  .environment(ViewModel())
		  .previewLayout(.sizeThatFits)
}
