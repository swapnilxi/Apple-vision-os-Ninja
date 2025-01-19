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
	 @State private var selectedImmersionStyle: ImmersionStyle = .mixed
	 @State private var fullImmersionStyle: ImmersionStyle = .full

	 var body: some Scene {
		  WindowGroup {
				ContentView()
					 .environment(appModel)
		  }

		 ImmersiveSpace(id: "CoursesView") {
			  CoursesView()
		  }
		  .immersionStyle(selection: $selectedImmersionStyle, in: .mixed)

		 ImmersiveSpace(id: "LearningView") {
				LearningView()
		  }
		  .immersionStyle(selection: $selectedImmersionStyle, in: .mixed)

		  ImmersiveSpace(id: appModel.immersiveSpaceID) {
				ImmersiveView()
					 .environment(appModel)
		  }
		  .immersionStyle(selection: .constant(.progressive), in: .progressive)
	 }
}
