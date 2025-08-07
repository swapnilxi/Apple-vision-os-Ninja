//
//  ContentView.swift
//  HandTracking
//
//  Created by swapnil on 8/5/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        RealityView { content in
            let sphere = ModelEntity(mesh: .generateSphere(radius: 0.01))
            sphere.name = "fingerTipSphere"
            sphere.model?.materials = [SimpleMaterial(color: .red, isMetallic: false)]
            
            let anchor = AnchorEntity()
            anchor.addChild(sphere)
            content.add(anchor)
        } update: { content in
            if let hand = InputDevice.hand(),
               let indexTip = hand.pose(for: .indexFingerTip)?.position {
                if let entity = content.entities.first(where: { $0.name == "fingerTipSphere" }) {
                    entity.position = indexTip
                }
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
