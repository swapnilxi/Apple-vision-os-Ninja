//
//  EnvironmentPicker.swift
//  Vision-os-labs
//
//  Created by swapnil on 8/12/25.
//

import SwiftUI

struct EnvironmentPicker: View {
    @State private var selectedEnvironment: EnvironmentType = .none

        var body: some View {
            VStack(spacing: 50) {
                // The display view that will react to our changes
                EnvironmentDisplayView()

                // The control buttons at the bottom
                HStack(spacing: 20) {
                    Button("Forest") { selectedEnvironment = .forest }
                    Button("Office") { selectedEnvironment = .office }
                    Button("Bedroom") { selectedEnvironment = .cozyBedroom }
                    Button("Calm") { selectedEnvironment = .calm }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            // This injects our state into the environment for the display view
            .environment(\.currentEnvironment, selectedEnvironment)
        }
}

#Preview {
    EnvironmentPicker()
}
