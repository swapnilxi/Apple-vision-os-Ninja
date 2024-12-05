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
	public static let stegosaurusRealityView = "stegosaurusRealityView"
	public static let brachiosaurusImmersive = "brachiosaurusImmersive"
	public static let findADino = "findADino"
	
	public static let stegosaurusModel3D = "stegosaurusModel3D"
	
	@State var headsetPositionManager = HeadsetPositionManager()

   
    var body: some Scene {
		 //window
        WindowGroup(id: Self.homeView) {
            HomeView()
                }
                .defaultSize(width: 1200, height: 1000)
         //window-card
        WindowGroup(id: Self.dinoCard) {
            DinoCardView()
                }
            .defaultSize(width: 600, height: 650)
          //window-portal
        WindowGroup(id: Self.dinoPortalCard) {
            DinoPortalCard()
                }
                .defaultSize(width: 600, height: 650)
		 //window-volume
		 WindowGroup(id: Self.triceratopsVolume) {
			  TriceratopsVolumeView()
		 }
		 .windowStyle(.volumetric)
		 .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
		 
		 //window-volume
		 WindowGroup(id: Self.velociraptorVolume) {
			  VelociraptorVolumeView()
		 }
		 .windowStyle(.volumetric)
		 .defaultSize(width: 2, height: 1, depth: 2, in: .meters)
		 
		 //Immersive
		 ImmersiveSpace(id: Self.stegosaurusRealityView) {
			  ImmersiveAnimatedStegosaurusView()
		 }
		 
		 //portal
		 ImmersiveSpace(id: Self.findADino) {
			  FindADinoView()
					.environment(headsetPositionManager)
		 }
    }
}
