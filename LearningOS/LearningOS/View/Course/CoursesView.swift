//
//  CoursesView.swift
//  LearningOS
//
//  Created by Abundent on 31/12/24.
//

import SwiftUI
import RealityKit

// Courses Immersive View
struct CoursesView: View {
	var body: some View {
		RealityView { content in
			Text("Prism and Rectangle")
			let prism = ModelEntity(
								mesh: .generateBox(width: 0.8, height: 0.3, depth: 0.5),
								materials: [SimpleMaterial(color: .green, roughness: 0.5, isMetallic: true)]
						  )
						  prism.position = SIMD3(x: 0, y: 0.5, z: -1)
						  content.add(prism)
			
			let rectangle = ModelEntity(
							 mesh: .generatePlane(
								  width: 1.0,      // Horizontal size
								  depth: 0.5       // Depth (vertical size if rotated)
							 ),
							 materials: [SimpleMaterial(color: .blue, isMetallic: false)]
						)
						
						// Position and rotate to face the user
						rectangle.position = SIMD3(x: 0, y: 0, z: -1)
						rectangle.transform.rotation = simd_quatf(angle: .pi/2, axis: [1, 0, 0]) // Rotate 90° around X-axis
						
						content.add(rectangle)
		}
		}
	/*
	@Environment(ViewModel.self) private var model
	
	@Environment(\.openWindow) private var openWindow
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

	 var body: some View {
		 @Bindable var model = model
		 
		 VStack{
//			RealityView { content in
//				// Create a text entity for courses
//				let textMesh = MeshResource.generateText(
//					"Welcome to Courses",
//					extrusionDepth: 0.1,
//					font: .systemFont(ofSize: 0.2),
//					containerFrame: .zero,
//					alignment: .center,
//					lineBreakMode: .byWordWrapping
//				)
//				
//				let textMaterial = SimpleMaterial(color: .white, isMetallic: true)
//				let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
//				textEntity.position = SIMD3(x: 0, y: 1.5, z: -2)
//				
//				// Add some course cards in 3D space
////				let courseTitles = ["Mathematics", "Physics", "Chemistry"]
////				for (index, title) in courseTitles.enumerated() {
////					 let cardEntity = createCourseCard(title: title)
////					 cardEntity.position = SIMD3(x: Float(index) - 1, y: 1.0, z: -1.5)
////					 content.add(cardEntity)
////				}
////
//				content.add(textEntity)
//			}
			 
			NavigationStack(path: $model.navigationPath ) {
								 Text("Courses Available")
					.navigationDestination(for: Module.self) { module in
						  Text("You are viewing \(module.name)")
							}
					.onAppear {
								  print("navigationPath onAppear: \(model.navigationPath)")
							 }
				
					  }
			 
			 
		 }//:Vstack
		 .onChange(of: model.navigationPath) { _, path in
			  if path.isEmpty {
					if model.isShowingLinkedinView {
						dismissWindow(id:  Module.linkedin.name )
					}
				  if model.isShowingPortfolioView || model.isShowingPersonalBrandingView {
						 Task {
							  await dismissImmersiveSpace()
						 }
					}
			  }
		 }

		
		 
		 
		 
	 }
	
	
	 
	 private func createCourseCard(title: String) -> ModelEntity {
		  let mesh = MeshResource.generatePlane(width: 0.5, height: 0.3)
		  let material = SimpleMaterial(color: .gray, isMetallic: true)
		  let card = ModelEntity(mesh: mesh, materials: [material])
		  
		  let titleMesh = MeshResource.generateText(
				title,
				extrusionDepth: 0.01,
				font: .systemFont(ofSize: 0.05),
				containerFrame: .zero,
				alignment: .center,
				lineBreakMode: .byWordWrapping
		  )
		  let titleEntity = ModelEntity(mesh: titleMesh, materials: [SimpleMaterial(color: .white, isMetallic: false)])
		  titleEntity.position = SIMD3(x: 0, y: 0, z: 0.01)
		  card.addChild(titleEntity)
		  
		  return card
	 }
	 
	 */
}

#Preview{
	CoursesView()
		.previewLayout(.sizeThatFits)
}
