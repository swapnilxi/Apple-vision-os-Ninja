//
//  SidebarView.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 7/26/25.
//

import SwiftUI

import SwiftUI

struct SidebarView: View {
    @Binding var selectedSidebar: SidebarSection?
    let onEnterImmersive: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // App/Brand Header
            HStack {
                            Text("Teams")
                                .font(.headline)
                            Spacer()
                            Button(action: onEnterImmersive) {
                                Image(systemName: "arkit") // Try "cube", "sparkles", "view.3d" for other looks
                                    .imageScale(.large)
                                    .foregroundColor(.accentColor)
                                    .padding(6)
                                    .background(Color(.systemGray5).opacity(0.6))
                                    .clipShape(Circle())
                                    .help("Enter Immersive Space")
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 4)

            // Sidebar navigation buttons using your reusable SidebarButton
            SidebarButton(
                iconName: "person.3.fill",
                label: "Meetings",
                isSelected: selectedSidebar == .meetings,
                action: { selectedSidebar = .meetings }
            )
            SidebarButton(
                iconName: "bubble.left.and.bubble.right.fill",
                label: "Chats",
                isSelected: selectedSidebar == .chats,
                action: { selectedSidebar = .chats }
            )
            SidebarButton(
                iconName: "doc.fill",
                label: "Files",
                isSelected: selectedSidebar == .files,
                action: { selectedSidebar = .files }
            )
            SidebarButton(
                iconName: "brain.head.profile",
                label: "AI Agents",
                isSelected: selectedSidebar == .aiAgents,
                action: { selectedSidebar = .aiAgents }
            )

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6).opacity(0.5))
    }
}

struct StatefulPreviewWrapper<Value>: View {
    @State var value: Value
    let content: (Binding<Value>) -> any View

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> any View) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        AnyView(content($value))
    }
}

