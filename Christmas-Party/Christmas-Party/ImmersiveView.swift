//
//  ImmersiveView.swift
//  Christmas-Party
//
//  Created by Abundent on 08/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
					if let christmasHouseEntity = try? Entity.loadModel(named: "christmasHouse") {
						// Add the Christmas house entity to the scene
						immersiveContentEntity.addChild(christmasHouseEntity)
						
						// Adjust the position, scale, and orientation of the Christmas house entity if needed
						christmasHouseEntity.position = SIMD3<Float>(0, 0, 0) // Example position
						christmasHouseEntity.scale = SIMD3<Float>(1, 1, 1) // Example scale
						christmasHouseEntity.orientation = simd_quatf(angle: Float.pi, axis: SIMD3<Float>(0, 1, 0)) // Example orientation
					}
					
					let sphere = MeshResource.generateSphere(radius: 5.0)

										 // Create an unlit white material
										 var material = UnlitMaterial()
										 material.color = .init(tint: .white)

										 // Create a model entity with the sphere mesh and white material
										 let sphereEntity = ModelEntity(mesh: sphere, materials: [material])

										 // Invert the sphere to view from the inside
										 sphereEntity.scale = [1, 1, -1]

										 // Add the sphere entity to the immersive content
										 immersiveContentEntity.addChild(sphereEntity)
					
            }
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
        .environment(AppModel())
}
