//
//  TriceratopsVolumeView.swift
//  Dino-world-3D
//
//  Created by Abundent on 09/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct TriceratopsVolumeView: View {
	var body: some View {
		RealityView{ content in
			if let triceratops = try? await Entity(named: "Triceratops", in: realityKitContentBundle) {
				triceratops.position += [0, -1, 0]
				triceratops.scale *= 0.3
				
				if let anim = triceratops.availableAnimations.first {
					triceratops.playAnimation(anim.repeat())
				}
				
			
				
				
				content.add(triceratops)
			}
				
			}//RealityView
    }
}

#Preview {
    TriceratopsVolumeView()
}
