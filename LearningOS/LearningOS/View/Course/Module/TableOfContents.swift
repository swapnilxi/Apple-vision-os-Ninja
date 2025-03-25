//
//  TableOfContents.swift
//  LearningOS
//
//  Created by Abundent on 17/01/25.
//

import SwiftUI

struct TableOfContents: View {
	@Environment(ViewModel.self) private var model
	
	var body: some View {
		@Bindable var model = model
		VStack {
			Text("XR LMS")
				Image("TopIcon")
				  .opacity(model.isTitleFinished ? 1 : 0)
				  .accessibility(hidden: true)

			 Spacer(minLength: 120)

			 VStack {
				 //Title
				  // A hidden version of the final text keeps the layout fixed
				  // while the overlaid visible version types on.
				 TitleText(title: model.finalTitle)
					  .padding(.horizontal, 70)
					  .hidden()
					  .overlay(alignment: .leading) {
							TitleText(title: model.titleText)
								 .padding(.leading, 70)
					  }
				  Text("Discover a new way of looking at the world.",
						 comment: "The app's subtitle, appearing immediately below the title in a smaller font, on the splash screen.")
						.font(.title)
						.opacity(model.isTitleFinished ? 1 : 0)
			 }
			 .alignmentGuide(.CoursesGuide) { context in
				  context[VerticalAlignment.top]
			 }
			 .padding(.bottom, 24)
			
			//content cards
			 HStack(alignment: .top, spacing: 30) {
				 // redenring all the courses available from module 
				  ForEach(Module.allCases) {
						ModuleCard(module: $0)
				  }
			 }
			 .padding(.bottom, 8)
			 .opacity(model.isTitleFinished ? 1 : 0)

			 Spacer()
		}
			.padding(.horizontal, 50)
			.typeText(
				text: $model.titleText,
				finalText: model.finalTitle,
				isFinished: $model.isTitleFinished,
				isAnimated: !model.isTitleFinished)
		
			.background(
				alignment: Alignment(horizontal: .center, vertical: .CoursesGuide)
			) {
				 Image("IntroImage")
					.alignmentGuide(.CoursesGuide) { context in
							context[VerticalAlignment.top] + 100
					  }
					  .opacity(model.isTitleFinished ? 1 : 0)
					  .accessibility(hidden: true)
			}
			.animation(.default.speed(0.25), value: model.isTitleFinished)
		
	}

	
}
/// The text that displays the app's title.
private struct TitleText: View {
	 var title: String
	 var body: some View {
		  Text(title)
				.monospaced()
				.font(.system(size: 50, weight: .bold))
	 }
}

extension VerticalAlignment {
	 /// A custom alignment that pins the background image to the title.
	 private struct CoursesAlignment: AlignmentID {
		  static func defaultValue(in context: ViewDimensions) -> CGFloat {
				context[VerticalAlignment.top]
		  }
	 }

	 /// A custom alignment guide that pins the background image to the title.
	 fileprivate static let CoursesGuide = VerticalAlignment(
		CoursesAlignment.self
	 )
}

#Preview {
    TableOfContents()
		.environment(ViewModel())
}
