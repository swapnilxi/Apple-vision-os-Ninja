//
//  Linkedin.swift
//  LearningOS
//
//  Created by Abundent on 17/02/25.
//

import SwiftUI

struct Linkedin: View {
	@Environment(ViewModel.self) private var model
	
	@State var axRotateClockwise: Bool = false
	@State var axRotateCounterClockwise: Bool = false
	
	var body: some View {
		/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
	}
}

#Preview {
	Linkedin()
		 .environment(ViewModel())
}

