//
//  SidebarView.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 7/26/25.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Teams")
                .font(.headline)
                .padding(.top)
            
            // Sidebar navigation buttons
            // 
            Button("Meetings") {
                // Add action or navigation logic here
            }
            Button("Chats") {
                // Add action or navigation logic here
            }
            Button("Files") {
                // Add action or navigation logic here
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview() {
   SidebarView()
        .environment(AppModel())
}
