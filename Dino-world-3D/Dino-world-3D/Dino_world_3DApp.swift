//
//  Dino_world_3DApp.swift
//  Dino-world-3D
//
//  Created by Abundent on 03/11/24.
//

import SwiftUI

@main
struct Dino_world_3DApp: App {
    public static let homeView = "homeView"
    public static let dinoCard = "dinoCard"
    public static let dinoPortalCard = "dinoPortalCard"
	 public static let triceratopsVolume = "triceratopsVolume"
	 public static let velociraptorVolume = "velociraptorVolume"

   
    var body: some Scene {
        WindowGroup(id: Self.homeView) {
            HomeView()
                }
                .defaultSize(width: 1200, height: 1000)
                
        WindowGroup(id: Self.dinoCard) {
            DinoCardView()
                }
            .defaultSize(width: 600, height: 650)
                
        WindowGroup(id: Self.dinoPortalCard) {
            DinoPortalCard()
                }
                .defaultSize(width: 600, height: 650)
		 
		 WindowGroup(id: Self.triceratopsVolume) {
			  TriceratopsVolumeView()
		 }
		 .windowStyle(.volumetric)
		 .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
		 
		 WindowGroup(id: Self.velociraptorVolume) {
			  VelociraptorVolumeView()
		 }
		 .windowStyle(.volumetric)
		 .defaultSize(width: 2, height: 1, depth: 2, in: .meters)
    }
}
