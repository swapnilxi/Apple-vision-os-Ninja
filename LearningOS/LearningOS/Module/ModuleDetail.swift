//
//  ModuleDetails.swift
//  LearningOS
//
//  Created by Abundent on 22/01/25.
//

import SwiftUI

struct ModuleDetail: View {
	 @Environment(ViewModel.self) private var model

	 var module: Module

	 var body: some View {
		  @Bindable var model = model

		  GeometryReader { proxy in
			  let textWidth = min(
				max(proxy.size.width * 0.4, module == .linkedin ? 500 : 300),
				500
			  )
				let imageWidth = min(max(proxy.size.width - textWidth, 300), 700)
				ZStack {
					 HStack(spacing: 60) {
						  VStack(alignment: .leading, spacing: 0) {
							  
							  //heading - overview
								Text(module.heading)
									 .font(.system(size: 50, weight: .bold))
									 .padding(.bottom, 15)
									 .accessibilitySortPriority(4)

								Text(module.overview)
									 .padding(.bottom, 24)
									 .accessibilitySortPriority(3)

								switch module {
								case .linkedin:
									LinkedinToggle()
								case .portfolio:
									PortfolioToggle()
								case .personalBranding:
									PersonalBrandingToggle()
								}
						  }
						  .frame(width: textWidth, alignment: .leading)
						 
						 //DetailView
						  module.detailView
								.frame(width: imageWidth, alignment: .center)
					 }
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
		  }
		  .padding([.leading, .trailing], 70)
		  .padding(.bottom, 24)
//		  .background {
//			  if module == .linkedin {
//					 Image("SolarBackground")
//						  .resizable()
//						  .scaledToFill()
//						  .accessibility(hidden: true)
//				}
//		  }

		  // A settings button in an ornament,
		  // visible only when `showDebugSettings` is true.
		 
//		  .settingsButton(module: module)
		 
	}
}

extension Module {
	 @ViewBuilder
	 fileprivate var detailView: some View {
		  switch self {
		  case .linkedin: LinkedinModule()
		  case .portfolio: PortfolioModule()
		  case .personalBranding: PortfolioModule()
		  }
	 }
}

#Preview {
	ModuleDetail(module: .linkedin)
}
