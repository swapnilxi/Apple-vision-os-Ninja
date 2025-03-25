//
//  CourseFile.swift
//  LearningOS
//
//  Created by Abundent on 16/01/25.
//

import SwiftUI

struct CourseFile: View {
	
	@Environment(ViewModel.self) private var model
	
	@Environment(\.openWindow) private var openWindow
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
	
    var body: some View {
		 @Bindable var model = model
		 VStack{
			 NavigationStack(path: $model.navigationPath ) {
								  Text("Courses Available")
					 .navigationDestination(for: Module.self) { module in
							Text("You are viewing \(module.name)")
							 }
					 .onAppear {
									print("navigationPath onAppear: \(model.navigationPath)")
							  }
				 
						}
			 
		 }//Mark:-Vstack
			 .onChange(of: model.navigationPath) { _, path in
				  if path.isEmpty {
						if model.isShowingLinkedinView {
							dismissWindow(id:  Module.linkedin.name )
						}
					  if model.isShowingPortfolioView || model.isShowingPersonalBrandingView {
							 Task {
								  await dismissImmersiveSpace()
							 }
						}
				  }
			 }
    }
}

#Preview {
    CourseFile()
		.environment(ViewModel())
}
