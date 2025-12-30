//
//  ContentView.swift
//  Vision-os-labs
//
//  Created by swapnil on 5/7/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var enlarge = false

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            PostsScene()
       

//            ToggleImmersiveSpaceButton()
        
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
