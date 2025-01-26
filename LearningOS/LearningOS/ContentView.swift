//
//  ContentView.swift
//  LearningOS
//
//  Created by Abundent on 26/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
	
        VStack {
			  HStack{
				  MenuView(selectedImmersionStyle: .constant(.mixed))
					  .padding()
				  VStack{
					  Model3D(named: "Scene", bundle: realityKitContentBundle)
							.padding(.bottom, 50)

					  Text("Welcome to Learning OS")

					  ToggleImmersiveSpaceButton()
				  }
				  
				 
			  }//hstack-menuView
			 .padding()
			  
			  }
			  
	
           
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
