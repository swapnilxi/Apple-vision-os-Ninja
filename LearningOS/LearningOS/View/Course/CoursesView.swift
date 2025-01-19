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
	@Environment(ViewModel.self) private var model

	 var body: some View {
		 @Bindable var model = model

		  RealityView { content in
				// Create a text entity for courses
				let textMesh = MeshResource.generateText(
					 "Welcome to Courses",
					 extrusionDepth: 0.1,
					 font: .systemFont(ofSize: 0.2),
					 containerFrame: .zero,
					 alignment: .center,
					 lineBreakMode: .byWordWrapping
				)
				
				let textMaterial = SimpleMaterial(color: .white, isMetallic: true)
				let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
				textEntity.position = SIMD3(x: 0, y: 1.5, z: -2)
				
				// Add some course cards in 3D space
				let courseTitles = ["Mathematics", "Physics", "Chemistry"]
				for (index, title) in courseTitles.enumerated() {
					 let cardEntity = createCourseCard(title: title)
					 cardEntity.position = SIMD3(x: Float(index) - 1, y: 1.0, z: -1.5)
					 content.add(cardEntity)
				}
				
				content.add(textEntity)
		  }
		 
		 NavigationStack(path: $model.navigationPath ) {
							  Text("Courses Available")
				 .navigationDestination(for: Module.self) { module in
							Text("You are viewing \(module.name)")
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
}

#Preview{
	CoursesView()
}
