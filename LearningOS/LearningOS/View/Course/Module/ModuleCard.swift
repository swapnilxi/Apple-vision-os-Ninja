//
//  ModuleCard.swift
//  LearningOS
//
//  Created by Abundent on 30/01/25.
//

import SwiftUI

struct ModuleCard: View {
	 var module: Module

	 var body: some View {
		  NavigationLink(value: module) {
				VStack(alignment: .leading, spacing: 4) {
					Text(module.subTitle)
						  .font(.callout)
						  .bold()
						  .foregroundStyle(.secondary)
					 VStack(alignment: .leading, spacing: 10) {
						  Text(module.heading)
								.font(.largeTitle)
						 //abstract is text field talking short intor about the course
						  Text(module.abstract)
					 }
				}
				.padding(.vertical, 30)
		  }
		  .buttonStyle(.borderless)
		  .buttonBorderShape(.roundedRectangle(radius: 20))
		  .frame(minWidth: 200, maxWidth: 355)
	 }
}

#Preview {
	 HStack {
		 ModuleCard(module: .linkedin)
		 ModuleCard(module: .portfolio)
		 ModuleCard(module: .personalBranding)
	
	 }
	 .padding()
	 .glassBackgroundEffect()
}
