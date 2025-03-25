//
//  VelociraptorVolumeView.swift
//  Dino-world-3D
//
//  Created by Abundent on 08/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct VelociraptorVolumeView: View {
    var body: some View {
		 TimelineView(.animation){ context in
			 Model3D(named:"Velociraptor", bundle: realityKitContentBundle){
				 model in
				  model
						.resizable()
						.scaledToFit()
						.scaleEffect(0.6)
						.rotation3DEffect(.degrees(context.date.timeIntervalSinceReferenceDate * 10 ), axis: .y)
			 } placeholder: {
				 ProgressView()
			 }
			 Text("Velociraptor Volume View")
				 .padding(10)
				 .glassBackgroundEffect()
				 
		 }
    }
}

#Preview {
    VelociraptorVolumeView()
}
