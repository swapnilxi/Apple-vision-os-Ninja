//
//  SidebarButton.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 7/28/25.
//

import SwiftUI

struct SidebarButton: View {
    let iconName: String
    let label: String
    let isSelected: Bool
    let action: () -> Void     // Callback when tapped

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: iconName)
                    .frame(width: 24, height: 24)
                    .imageScale(.medium)
                Text(label)
                    .font(.body)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle()) // Makes the entire area clickable
    }
}

// Sidebar navigation enum
enum SidebarSection: String {
    case meetings = "Meetings"
    case chats = "Chats"
    case files = "Files"
    case aiAgents = "AI Agents"
}
