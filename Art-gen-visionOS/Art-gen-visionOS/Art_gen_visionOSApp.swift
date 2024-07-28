//
//  Art_gen_visionOSApp.swift
//  Art-gen-visionOS
//
//  Created by Abundent on 28/06/24.
//


import SwiftUI



@main
struct Art_gen_visionOSApp: App {

    @State private var viewModel = ViewModel()
    
    init() {
        
          ImpactParticleSystem.registerSystem()
          ProjectileComponent.registerComponent()
      }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .windowStyle(.plain)
        
        WindowGroup("textEditor") {
            ContentView()
                .environment(viewModel)
        }
        .windowStyle(.plain)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(viewModel)
             
        }
        .immersionStyle(selection: .constant(.mixed), in: .full)
        
        WindowGroup("doodle_canvas"){
            DoodleView()
            .environment(viewModel)
        }
    }
}
