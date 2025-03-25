//
//  ContentView.swift
//  Art-gen-visionOS
//
//  Created by Abundent on 28/06/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    @State private var enlarge = false

    var body: some View {
        
        VStack(alignment:.leading, content: {
            Text("Welcome to Generative Drawing")
                .font(.extraLargeTitle2)
        })
        .padding(50)
        .glassBackgroundEffect()
        .onAppear(
            perform: {
                Task{
                    await openImmersiveSpace(id:"ImmersiveSpace")
                }
            }
        )
        
        
    }
    
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
