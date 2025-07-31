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
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)

        // ImmersiveSpace block is a peer to WindowGroup, not nested inside it
        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView(exitImmersive: {
                // This closure will exit immersive space
                isImmersiveActive = false
                appModel.immersiveSpaceState = .closed
            })
            .environment(appModel)
            .onAppear {
                appModel.immersiveSpaceState = .open
            }
            .onDisappear {
                appModel.immersiveSpaceState = .closed
            }
        }
        .immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}
