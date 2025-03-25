//
//  CoursesView.swift
//  LearningOS
//
//  Created by Abundent on 31/12/24.
//

import SwiftUI
import RealityKit
import UIKit  // Import UIKit for UIColor

struct CoursesView: View {
	 @Environment(ViewModel.self) private var model
	 @Environment(\.openWindow) private var openWindow
	 @Environment(\.dismissWindow) private var dismissWindow
	 @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
	 
	 var body: some View {
		  @Bindable var model = model
		  
		  ZStack {
				// RealityKit 3D content
				RealityView { content in
					 let courseTitles = ["LinkedIn", "Portfolio", "Personal\nBranding"]
					 let cardSpacing: Float = 1.5
					 let startX = -(Float(courseTitles.count - 1) * cardSpacing) / 2
					 
					 for (index, title) in courseTitles.enumerated() {
						  let card = createCourseCard(title: title)
						  card.position = SIMD3<Float>(
								x: startX + Float(index) * cardSpacing,
								y: 1.0,
								z: 0.5
						  )
						  content.add(card)
					 }
				}
				
				// Navigation Stack (positioned at top, unchanged)
			  NavigationStack(path: $model.navigationPath ) {
									Text("Courses Available")
								TableOfContents()
					  .navigationDestination(for: Module.self) { module in
							 Text("You are viewing \(module.name)")
							  }
					  .onAppear {
									 print("navigationPath onAppear: \(model.navigationPath)")
								}
				  
						 }
		  }
	 }
	 
	 /// Creates a card with centered text (avoiding SwiftUI Color bridging).
	 private func createCourseCard(title: String) -> ModelEntity {
		  let cardWidth: Float = 0.8
		  let cardHeight: Float = 1.0
		  
		  // Generate the plane for the card
		  let cardMesh = MeshResource.generatePlane(
				width: cardWidth,
				height: cardHeight,
				cornerRadius: 0.1
		  )
		  
		  // Create a "glass" material using UIColor
		 let glassColor = UIColor.white.withAlphaComponent(0.2)
		 let cardMaterial = UnlitMaterial(
			  color: glassColor,
			  applyPostProcessToneMap: false
		 )






		  let cardEntity = ModelEntity(mesh: cardMesh, materials: [cardMaterial])
		  
		  // Generate the text mesh (center alignment, no containerFrame)
		  let textMesh = MeshResource.generateText(
				title,
				extrusionDepth: 0.01,
				font: .systemFont(ofSize: 0.15),
				alignment: .center
		  )
		  
		  // SimpleMaterial with UIColor
		  
		 let textMaterial = SimpleMaterial(color: .white, isMetallic: false)
		  let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
		  
		  // Center the text entity
		  let textBounds = textMesh.bounds.extents
		  textEntity.position = SIMD3<Float>(
				x: -textBounds.x / 2,
				y: -textBounds.y / 2,
				z: 0.01
		  )
		  cardEntity.addChild(textEntity)
		  
		  // Optional subtle border behind the card
		  let borderMesh = MeshResource.generatePlane(
				width: cardWidth + 0.02,
				height: cardHeight + 0.02,
				cornerRadius: 0.11
		  )
	
		 let borderMaterial = SimpleMaterial(
			color: .white, // Directly pass the UIColor
			  roughness: 0.0,    // Optional (non-metallic)
			  isMetallic: false  // Set to false for non-reflective surfaces
		 )
		  let borderEntity = ModelEntity(mesh: borderMesh, materials: [borderMaterial])
		  borderEntity.position.z = -0.001
		  cardEntity.addChild(borderEntity)
		  
		  return cardEntity
	 }
}

#Preview {
	 CoursesView()
		  .environment(ViewModel())
		  .previewLayout(.sizeThatFits)
}
