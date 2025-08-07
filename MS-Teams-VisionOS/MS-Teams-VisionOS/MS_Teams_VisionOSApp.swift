//
//  MS_Teams_VisionOSApp.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 7/25/25.
//

import SwiftUI

@main
struct MS_Teams_VisionOSApp: App {
    @State private var appModel = AppModel()
    @State private var isImmersiveActive = false

    var body: some Scene {
        // Main 2D window
        WindowGroup(id: "main-window") {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.plain)
        .defaultSize(width: 700, height: 500)
        
        // Register a dummy volumetric window to satisfy system requirements.
        WindowGroup(id: "volumeScene") {
            ContentView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 700, height: 900, depth: 1)

        // Your immersive space (if you use it)
        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView(exitImmersive: {
                isImmersiveActive = false
                appModel.immersiveSpaceState = .closed
            })
            .environment(appModel)
            .onAppear { appModel.immersiveSpaceState = .open }
            .onDisappear { appModel.immersiveSpaceState = .closed }
        }
        .immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}
