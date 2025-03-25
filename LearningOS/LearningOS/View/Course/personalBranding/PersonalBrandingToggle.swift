//
//  PersonalBrandingToggle.swift
//  LearningOS
//
//  Created by Abundent on 22/01/25.
//

import SwiftUI

struct PersonalBrandingToggle: View {
	@Environment(ViewModel.self) private var model
	@Environment(\.openImmersiveSpace) private var openImmersiveSpace
	@Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
	
    var body: some View {
		 Button {
			  Task {
				  if model.isShowingPersonalBrandingView {
						 await dismissImmersiveSpace()
					} else {
						await openImmersiveSpace(id: Module.personalBranding.name)
					}
			  }
		 }label: {
			 if model.isShowingPersonalBrandingView{
				 Label(
				 "exit the Personal Branding view",
				 systemImage: "arrow.down.right.and.arrow.up.left"
				 )
			 }else{
				 Text(Module.personalBranding.callToAction)
			 }
		 }
		 
		 
    }
}

#Preview {
    PersonalBrandingToggle()
		.environment(ViewModel())
}
