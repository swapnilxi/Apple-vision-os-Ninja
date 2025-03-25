//
//  GlobeModel.swift
//  Globe-Reality-kit
//
//  Created by Abundent on 25/08/24.
//

import SwiftUI
import RealityKit

struct GlobeModule: View {
    var body: some View {
        Text("Hello, Globe!")
        Model3D(named: "Globe"){ model in
            model
                .resizable()
                .scaledToFit()
        } placeholder: {
            Text("Hello, Globe1!")
            ProgressView()//loader
        }
    }
}

#Preview {
    GlobeModule()
}
