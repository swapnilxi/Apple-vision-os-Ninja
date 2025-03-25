//
//  PersonalBrandingModule.swift
//  LearningOS
//
//  Created by Abundent on 22/01/25.
//

import SwiftUI

struct PersonalBrandingModule: View {
    var body: some View {
		 Image("PersonalBrandingHero")
			  .resizable()
			  .scaledToFit()
    }
}

#Preview {
    PersonalBrandingModule()
		.padding()
}
