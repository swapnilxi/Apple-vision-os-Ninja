//
//  TriangleView.swift
//  ProceduralSphere
//
//  Created by Abundent on 29/10/24.
//

import SwiftUI
import RealityKit

struct TriangleView: View {
    var body: some View {
        RealityView{content in
            var descriptor = MeshDescriptor(name:"triangle")
            descriptor.positions = MeshBuffers.Positions([
            [-1,-1,0],[1,-1,0],[0,1,0]
            ])
            descriptor.primitives = .triangles([0,1,2])
            let entity = ModelEntity(
                mesh: try! await MeshResource(from: [descriptor]), 
                materials: [SimpleMaterial(color: .red, isMetallic: true)]
            )
            
            content.add(ModelEntity(mesh: .generateSphere(radius: 0.01),
                                    materials: [SimpleMaterial(color:.cyan, isMetallic: true)]
                                   ))
            
            entity.scale = .init(x:0.1,y:0.1,z:0.1)
            content.add(entity)
            
            
        }
    }
}

#Preview {
    TriangleView()
}
