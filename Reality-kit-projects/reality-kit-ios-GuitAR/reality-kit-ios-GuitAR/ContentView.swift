//
//  ContentView.swift
//  reality-kit-ios-GuitAR
//
//  Created by Abundent on 30/07/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        ARViewContainer().ignoresSafeArea(.all)
    }
}
struct ARViewContainer: UIViewRepresentable {
    //MARK- MakeUIView
    func makeUIView(context: Context) -> some ARView {
        let arView = ARView(frame: .zero)
        //        let guitarAnchor= Experience.loadGuitar();
        // adding the sceneGraph
//               
        return arView
    }
    //MARK- updateUIView
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // not used
    }
}
    


#Preview {
    ContentView()
}
