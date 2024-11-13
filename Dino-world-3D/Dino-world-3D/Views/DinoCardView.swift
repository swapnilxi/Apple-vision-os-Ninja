//
//  DinoCardView.swift
//  Dino-world-3D
//
//  Created by Abundent on 04/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DinoCardView: View {
	@Environment(\.openWindow) private var openWindow
	
    var body: some View {
		 VStack(spacing:50){
			 Text("Velociraptor")
				 .font(.extraLargeTitle)
				 .padding(40)
		 }
		 
		 Model3D(named: "Velociraptor", bundle: realityKitContentBundle) { model in
			  model
					.resizable()
					.scaledToFit()
					.rotation3DEffect(.degrees(90 ) , axis: .y)
		 } placeholder: {
			  ProgressView()
		 }
		 .frame(depth: 200, alignment: .center)
		 .frame(height: 200)
		 .overlay{
			 Button(action:{
				 openWindow(id: Dino_world_3DApp.velociraptorVolume)
			 }, label: {
				 Text("Show Model")
					 .padding(20)
					 .frame(width: 400)
			 })
			 
		 }
		 
		  Text("The Velociraptor was a small, fast, and intelligent dinosaur known for its sharp claws and hunting prowess during the Late Cretaceous period.")
				.frame(maxWidth: 500)
				.padding(40)
    }
}

#Preview {
    DinoCardView()
}
