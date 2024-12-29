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
}

let menuItems = [
		MenuItem(name: "Courses", description: "Choose your own course.",  iconName: "book.closed.fill"),
		MenuItem(name: "Learning", description: "Make Learning Path and course for your yourself",  iconName: "graduationcap.fill"),
		MenuItem(name: "Creator", description: "Make Course for other", iconName: "person.fill.viewfinder")
  ]

struct GlassBackground: ViewModifier {
	 func body(content: Content) -> some View {
		  content
				.background(.ultraThinMaterial)
				.cornerRadius(20)
				.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
	 }
}

struct MenuCard: View {
	 let item: MenuItem
	@State private var isPressed = false
	@State private var depth: CGFloat = 0
	 
	 var body: some View {
		  VStack(alignment: .leading, spacing: 12) {
			  ZStack {
									Circle()
											.fill(Color.white)
										 .frame(width: 60, height: 60)
										 .background(.ultraThinMaterial, in: Circle())
										 .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
									
									Image(systemName: item.iconName) // Using the iconName directly
										 .font(.system(size: 24, weight: .bold))
										 .foregroundStyle(.blue.gradient)
										 .symbolEffect(.bounce, value: isPressed)
										 .frame(width: 50, height: 50)
							  }
				Text(item.name)
					 .font(.title2)
					 .fontWeight(.bold)
				
				Text(item.description)
					 .font(.body)
					 .foregroundColor(.secondary)
					 .lineLimit(2)
			  
				//learn More icon
			  VStack(alignment:.leading) {
					 Image(systemName: "arrow.right.circle.fill")
						  .foregroundColor(.blue)
					 Text("Learn More")
						  .font(.subheadline)
						  .fontWeight(.semibold)
						  .foregroundColor(.blue)
					 Spacer()
				}
		  }
		  .padding(20)
		  .frame(width: 250, height: 200)
		  .modifier(GlassBackground())
		  .hoverEffect(.lift)
		  .rotation3DEffect(
						  .degrees(isPressed ? 5 : 0),
						  axis: (x: 0.5, y: 0.5, z: 0)
					 )
					 .offset(z: depth)
					 .onTapGesture {
						  withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
								isPressed.toggle()
								depth = isPressed ? 100 : 0  // Move 100 points forward on z-axis when pressed
						  }
					 }
					 
	 }
}

struct MenuView: View {
	 var body: some View {
		  ZStack {
				// Background gradient
				LinearGradient(
					 colors: [.gray.opacity(0.7), .white.opacity(0.7)],
					 startPoint: .topLeading,
					 endPoint: .bottomTrailing
				)
				.ignoresSafeArea()
				
				ScrollView(.horizontal, showsIndicators: false) {
					 HStack(alignment: .center, spacing: 20) {
						  ForEach(menuItems) { item in
								MenuCard(item: item)
							  
						  }
					 }
					 .padding(.horizontal)
					 .padding(.vertical, 30)
//					 .glassBackgroundEffect() // Adding glass effect for visionOS
					 .containerRelativeFrame([.horizontal, .vertical])
				
					
				}
		  }
	 }
}

#Preview {
    MenuView()
}
