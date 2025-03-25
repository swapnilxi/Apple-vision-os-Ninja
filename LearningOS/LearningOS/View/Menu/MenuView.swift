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
	@Environment(AppModel.self) private var appModel
	
	var body: some View {
		HStack(spacing: 20) {
			
//			Button {
//				
//			}
			ForEach(menuItems) { item in
				Button(action: {
					Task {
						await toggleSpace(for: item.viewID)
					}
				}
						 , label:{
					MenuCard(item: item)
						.opacity(appModel.immersiveSpaceState == .inTransition ? 0.5 : 1)
				})
				
			}
		}
		.padding()
		
	}
	
	private func toggleSpace(for id: String) async {
			  if appModel.currentSpaceID == id {
					await dismissSpace()
			  } else {
					await openSpace(id: id)
			  }
		 }
	
	private func openSpace(id: String) async {
			 guard appModel.immersiveSpaceState != .inTransition else { return }
			 
			 appModel.updateState(.inTransition, spaceID: nil)
			 
			 do {
				  // Close any existing space first
				  await dismissSpace()
				  
				  switch await openImmersiveSpace(id: id) {
				  case .opened:
						appModel.updateState(.open, spaceID: id)
				  case .error, .userCancelled:
						appModel.updateState(.closed, spaceID: nil)
				  @unknown default:
						appModel.updateState(.closed, spaceID: nil)
				  }
			 }
		}
	private func dismissSpace() async {
			 guard appModel.immersiveSpaceState != .inTransition else { return }
			 
			 appModel.updateState(.inTransition, spaceID: nil)
			 
			 await dismissImmersiveSpace()
			 appModel.updateState(.closed, spaceID: nil)
		}
	
}




#Preview {
	 MenuView(selectedImmersionStyle: .constant(.mixed))
		.environment(ViewModel())
}



