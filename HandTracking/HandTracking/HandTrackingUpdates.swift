//
//  Untitled.swift
//  HandTracking
//
//  Created by swapnil on 8/5/25.
//

import RealityKit
import ARKit
import Combine

class HandTrackingUpdates {
    static let shared = HandTrackingUpdates()
    
    private var cancellable: AnyCancellable?
    private(set) var stream = AsyncStream<HandPose> { continuation in
        Task {
            for await hands in HandAnchorUpdates() {
                if let firstHand = hands.first {
                    let indexTip = firstHand.indexFingerTipPosition
                    continuation.yield(HandPose(indexTip: indexTip))
                }
            }
        }
    }

    func updateEntityPosition(named name: String, to position: SIMD3<Float>) {
        Task { @MainActor in
            if let scene = await RealityView.scene(named: "handSphere"),
               let entity = scene.findEntity(named: name) {
                entity.position = position
            }
        }
    }
}

struct HandPose {
    let indexTip: SIMD3<Float>?
}
