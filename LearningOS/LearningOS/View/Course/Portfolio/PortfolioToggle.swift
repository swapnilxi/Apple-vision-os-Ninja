//
//  PortfolioToggle.swift
//  LearningOS
//
//  Created by Abundent on 22/01/25.
//

import SwiftUI

struct PortfolioToggle: View {
	@Environment(ViewModel.self) private var model
	@Environment(\.openImmersiveSpace) private var openImmersiveSpace
	@Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
	
    var body: some View {
		 @Bindable var model = model
		 
		 Toggle(
			Module.portfolio.callToAction,
			isOn: $model.isShowingPortfolioView
		 )
		 .onChange(of: model.isShowingPortfolioView) { _, isShowing in
					Task {
						 if isShowing {
							 await openImmersiveSpace(id: Module.portfolio.name)
						 } else {
							  await dismissImmersiveSpace()
						 }
					}
			  }
			  .toggleStyle(.button)
    }
}

#Preview {
    PortfolioToggle()
		.environment(ViewModel())
}
