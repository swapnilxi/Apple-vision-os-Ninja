//
//  ContentView.swift
//  Popping-Bubbles
//
//  Created by Abundent on 01/10/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack {
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)

            Text("Hello, world!")
                .frame(depth: 23) // Your custom depth frame
                .padding()        // Add padding to give space around the text
                .background(Color.blue)  // Add a background color behind the text
                .cornerRadius(10)  // Optional: Add rounded corners to the background


            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
