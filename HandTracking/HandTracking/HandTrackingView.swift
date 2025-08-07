//
//  HandTrackingView.swift
//  HandTracking
//
//  Created by swapnil on 8/5/25.
//

import SwiftUI
import RealityKit
import ARKit

struct HandTrackingView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Add sphere entity
        let sphere = MeshResource.generateSphere(radius: 0.01)
        let material = SimpleMaterial(color: .red, isMetallic: false)
        let sphereEntity = ModelEntity(mesh: sphere, materials: [material])
        sphereEntity.name = "indexSphere"
        
        let anchor = AnchorEntity(world: .zero)
        anchor.addChild(sphereEntity)
        arView.scene.anchors.append(anchor)

        // Start AR session with hand tracking config
        let config = ARBodyTrackingConfiguration()
        config.frameSemantics = [.personSegmentationWithDepth]
        if ARBodyTrackingConfiguration.isSupported {
            arView.session.run(config)
        }

        // Set session delegate
        arView.session.delegate = context.coordinator
        context.coordinator.arView = arView

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, ARSessionDelegate {
        weak var arView: ARView?

        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let handAnchor = anchor as? ARHandAnchor else { continue }

                if let jointTransform = handAnchor.transform(for: .indexFingerTip) {
                    let position = SIMD3<Float>(
                        jointTransform.columns.3.x,
                        jointTransform.columns.3.y,
                        jointTransform.columns.3.z
                    )

                    DispatchQueue.main.async {
                        if let entity = self.arView?.scene.findEntity(named: "indexSphere") {
                            entity.position = position
                        }
                    }
                }
            }
        }
    }
}
