//
//  MenuView.swift
//  LearningOS
//
//  Created by Abundent on 27/12/24.
//

import SwiftUI

struct MenuItem: Identifiable {
	 var id = UUID()
	 var name: String
	 var description: String
	 var iconName: String
	 var viewID: String
}

let menuItems = [
	MenuItem(name: "Courses", description: "Choose your own course.",  iconName: "book.closed.fill",  viewID: "CoursesView"),
		MenuItem(name: "Learning", description: "Make Learning Path and course for your yourself",  iconName: "graduationcap.fill",  viewID: "LearningView"),
		MenuItem(name: "Creator", description: "Make Course for other", iconName: "person.fill.viewfinder",  viewID: "CreatorView")
  ]

struct GlassBackground: ViewModifier {
	 func body(content: Content) -> some View {
		  content
				.background(.ultraThinMaterial)
				.cornerRadius(20)
				.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
	 }
}



struct MenuView: View {
	@Environment(\.openImmersiveSpace) private var openImmersiveSpace
	@Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
	@Binding var selectedImmersionStyle: ImmersionStyle
	
	var body: some View {
		HStack(spacing: 20) {
			
//			Button {
//				
//			}
			ForEach(menuItems) { item in
				Button(action: {
					Task {
						await openSpace(id: item.viewID)
					}
				}
						 , label:{
					MenuCard(item: item)
				})
				
			}
		}
		.padding()
		
	}
	
	func openSpace(id: String) async {
		 
		 //dismiss any open immersive space first
		 await dismissImmersiveSpace()
		 
		 switch await openImmersiveSpace(id: id) {
		 case .opened:
			  print("Immersive space \(id) successfully opened")
		 case .error:
			  fatalError("Error opening immersive space with id: \(id)")
		 case .userCancelled:
			  print("User cancelled")
		 default:
			  break
		 }
	}
	
}




#Preview {
	 MenuView(selectedImmersionStyle: .constant(.mixed))
}



