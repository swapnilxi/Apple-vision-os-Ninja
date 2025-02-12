//
//  LearningOSApp.swift
//  LearningOS
//
//  Created by Abundent on 26/12/24.
//

import SwiftUI

@main
struct LearningOSApp: App {
	 @State private var appModel = AppModel()
	 @State private var model = ViewModel()
	 @State private var selectedImmersionStyle: ImmersionStyle = .mixed
	
	@State private var mixedImmersionStyle: ImmersionStyle = .mixed
	 @State private var fullImmersionStyle: ImmersionStyle = .full
	
	// The immersion styles for different modules.
	@State private var portfolioImmersionStyle: ImmersionStyle = .mixed
	@State private var personalBrandingImmersionStyle: ImmersionStyle = .full
	
	
	//ids for Main Views can be accessed using self.idName
	public static let MenuView = "homeView"
	public static let CoursesViewId = "CoursesView"
	public static let LearningViewId = "LearningView"
	public static let CreatorView = "CreatorView"
	public static let TeachingView = "TeachingView"

	 var body: some Scene {
		  WindowGroup {
				ContentView()
					 .environment(appModel)
		  }
		 
		 //model-viewModel

		 ImmersiveSpace(id: "CoursesView") {
			  CoursesView()
//				 .environment(ViewModel())
				 .environment(model)
		  }
		  .immersionStyle(selection: $selectedImmersionStyle, in: .mixed)

		 ImmersiveSpace(id: "LearningView") {
				LearningView()
				 .environment(model)
		  }
		  .immersionStyle(selection: $selectedImmersionStyle, in: .mixed)
		 
		 ImmersiveSpace(id: Self.CreatorView) {
				LearningView()
				 .environment(model)
		  }
		  .immersionStyle(selection: $selectedImmersionStyle, in: .mixed)
		 
		 ImmersiveSpace(id: Self.TeachingView) {
				LearningView()
				 .environment(model)
		  }
		  .immersionStyle(selection: $selectedImmersionStyle, in: .mixed)

		  ImmersiveSpace(id: appModel.immersiveSpaceID) {
				ImmersiveView()
					 .environment(appModel)
		  }
		  .immersionStyle(selection: .constant(.progressive), in: .progressive)
		 
		 //model-viewModel
		 WindowGroup(id: Module.linkedin.name)  {
			 LinkedinWindow()
					.environment(model)
		 }
		 
		 ImmersiveSpace(id:Module.portfolio.name) {
			 PortfolioImmersiveMixed()
		  }
		 .immersionStyle(selection: $portfolioImmersionStyle, in: .mixed)
		 
		 ImmersiveSpace(id: Module.personalBranding.name) {
			 PersonalBrandingImmersiveFull()
					.environment(model)
		 }
		 .immersionStyle(selection: $personalBrandingImmersionStyle, in: .full)
	 }
}
