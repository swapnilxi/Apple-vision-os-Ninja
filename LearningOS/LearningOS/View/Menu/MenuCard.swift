//
//  MenuCard.swift
//  LearningOS
//
//  Created by Abundent on 29/12/24.
//

import SwiftUI

struct MenuCard: View {
	 let item: MenuItem
	 @State private var isPressed = false
	 @State private var depth: CGFloat = 0
	 
	 var body: some View {
		  VStack(alignment: .leading, spacing: 12) {
				// Icon Section
				ZStack {
					 Circle()
						  .fill(Color.white)
						  .frame(width: 60, height: 60)
						  .background(.ultraThinMaterial, in: Circle())
						  .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
					 
					 Image(systemName: item.iconName)
						  .font(.system(size: 24, weight: .bold))
						  .foregroundStyle(.blue.gradient)
						  .symbolEffect(.bounce.up.byLayer, value: isPressed)
						  .frame(width: 50, height: 50)
				}
				
				// Text Content
				VStack(alignment: .leading, spacing: 8) {
					 Text(item.name)
						  .font(.title2)
						  .fontWeight(.bold)
						  .foregroundColor(.primary)
					 
					 Text(item.description)
						  .font(.body)
						  .foregroundColor(.secondary)
						  .lineLimit(2)
						  .multilineTextAlignment(.leading)
				}
				
				Spacer()
				
				// Learn More Section
				HStack {
					 Text("Learn More")
						  .font(.subheadline)
						  .fontWeight(.semibold)
						  .foregroundColor(.blue)
					 
					 Image(systemName: "arrow.right.circle.fill")
						  .foregroundColor(.blue)
						  .imageScale(.medium)
						 
				}
		  }
		  .padding(20)
		  .frame(width: 250, height: 200)
		  .modifier(GlassBackground())
		  .hoverEffect(.lift)
		  
	 }
}

// Preview
#Preview {
	 MenuCard(
		  item: MenuItem(
				name: "Sample Item",
				description: "This is a sample description that might be a bit longer to test multiple lines.",
				iconName: "star.fill",
				viewID: "sampleView"
		  )
	 )
	 .padding()
	 .background(Color.gray.opacity(0.1))
}
