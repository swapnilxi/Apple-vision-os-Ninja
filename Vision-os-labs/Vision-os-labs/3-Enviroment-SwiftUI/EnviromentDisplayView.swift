//
//  EnviromentDisplayView.swift
//  Vision-os-labs
//
//  Created by swapnil on 8/16/25.
//

import SwiftUI
// This view reads the environment and changes its content
struct EnvironmentDisplayView: View {
    // Read our custom value from the environment
    @Environment(\.currentEnvironment) private var environmentType

    var body: some View {
        VStack {
            // Use a switch to show the right content
            switch environmentType {
            case .forest:
                Image(systemName: "leaf.fill")
                Text("Forest")
            case .office:
                Image(systemName: "building.2.fill")
                Text("Office")
            case .calm:
                Image(systemName: "wind")
                Text("Calm")
            case .cozyBedroom:
                Image(systemName: "bed.double.fill")
                Text("Cozy Bedroom")
            case .none:
                Text("Select an Environment")
            }
        }
        .font(.system(size: 50))
        .frame(minWidth: 500, minHeight: 300)
        .padding(100)
        .glassBackgroundEffect()
    }
}
