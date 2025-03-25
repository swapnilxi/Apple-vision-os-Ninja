//
//  ImmersiveView.swift
//  Portal_World
//
//  Created by Abundent on 10/10/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

@MainActor
struct ImmersiveView: View {
    @State private var box = Entity()
    

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "PortalBoxScene", in: realityKitContentBundle) {
                content.add(scene)
                
                guard let box = scene.findEntity(named: "Box")else{
                    fatalError()
                }
                
                
                self.box = box
                box.position = [0, 1, -1.5]
                box.scale *= [1,2,1]
                
                let skybox1 = await createSkyboxEntity(texture:
                 "skybox1"
                 )
                content.add(skybox1)
                
            }
        }
    }
    func createSkyboxEntity(texture: String) async -> Entity {
        guard let resource = try? await TextureResource(named: texture)else{
            fatalError("unable to load the object")
        }
        
        var material = UnlitMaterial()
        material.color = .init(texture: .init(resource))
        
        let entity = Entity()
        entity.components.set(ModelComponent(mesh: .generateSphere(radius: 1000), materials: [material]))
        return entity
        
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
     
}
