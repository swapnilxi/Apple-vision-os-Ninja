//
//  LinkedinToggle.swift
//  LearningOS
//
//  Created by Abundent on 22/01/25.
//

import SwiftUI

struct LinkedinToggle: View {
	@Environment(ViewModel.self) private var model
	@Environment(\.openWindow) private var openWindow
	@Environment(\.dismissWindow) private var dismissWindow
	
    var body: some View {
		 @Bindable var model = model
		 // initally toggle is on false
		 Toggle( Module.linkedin.callToAction ,isOn: $model.isShowingLinkedinView)
		 //changing on based of state
		 //implement on change of based on syntax
		 //view type is defined in LearningOSApp - like window or volume
			 .onChange(of: model.isShowingLinkedinView) { _, isShowing in
				  if isShowing {
					  openWindow(id: Module.linkedin.name)
				  } else {
					  dismissWindow(id: Module.linkedin.name)
				  }
			 }
		 
			 .toggleStyle(.button)
    }
}

#Preview {
    LinkedinToggle()
		.environment(ViewModel())
}
