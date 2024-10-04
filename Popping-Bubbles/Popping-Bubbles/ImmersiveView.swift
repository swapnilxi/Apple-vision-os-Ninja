//
//  ImmersiveView.swift
//  Popping-Bubbles
//
//  Created by Abundent on 01/10/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import BubbleShaderGraph

struct ImmersiveView: View {
    @State var predicate = QueryPredicate<Entity>.has(ModelComponent.self)
    @State private var timer: Timer?
    
    var body: some View {
        RealityView { content in
            if let immersiveContentEntity = try? await Entity(named: "BubbleScene", in: bubbleShaderGraphBundle) {
                content.add(immersiveContentEntity)
                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
        .gesture(SpatialTapGesture().targetedToEntity(where: predicate ).onEnded({
            value in
        let entity = value.entity
            var mat = entity.components[ModelComponent.self]?.materials.first
            as!
            ShaderGraphMaterial
            
            let frameRate: TimeInterval = 1.0/60.0 //60 FPS
            let duration : TimeInterval = 0.25
            let targetValue : Float = 1.0
            let totalFrames : Int = Int(duration / frameRate)
            var currentFrame = 0
            var popValue :  Float = 0.0
            
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval:  frameRate, repeats: true, block: { timer in
                currentFrame += 1
                let progress = Float(currentFrame)/Float(totalFrames)
                popValue = progress * targetValue
                
                do {
                    try mat.setParameter(name: "pop", value:  .float(popValue ))
                    entity.components[ModelComponent.self]?.materials = [mat]
                }
                catch{
                    print(error.localizedDescription )
                }
                if currentFrame >= totalFrames {
                     timer.invalidate()
                    entity.removeFromParent() 
                }
                
            })
            
            
            
            
        })
     )
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
        .environment(AppModel())
}
