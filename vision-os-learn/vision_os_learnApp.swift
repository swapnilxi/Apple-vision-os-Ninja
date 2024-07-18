//
//  vision_os_learnApp.swift
//  vision-os-learn
//
//  Created by Abundent on 15/06/24.
//

import SwiftUI

@main
struct vision_os_learnApp: App {
    @State var immersionState: ImmersionStyle = .mixed

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            SolarSystemView()

//            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
