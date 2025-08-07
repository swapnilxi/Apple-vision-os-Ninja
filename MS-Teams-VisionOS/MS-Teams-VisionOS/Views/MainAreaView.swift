//
//  MainAreaView.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 7/26/25.
//
import SwiftUI

struct MainAreaView: View {
    let selectedSidebar: SidebarSection?
    let enterImmersive: () -> Void

    var body: some View {
        ZStack {
            // VisionOS-style background
            RoundedRectangle(cornerRadius: 32)
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
                .shadow(radius: 20)

            VStack(alignment: .center) {
                if let section = selectedSidebar {
                    viewForSection(section)
                        .padding(.top, 30)
                } else {
                    Text("Welcome to MS Teams visionOS")
                        .font(.largeTitle)
                        .padding(.top, 30)
                }

                Spacer()

                Button(action: enterImmersive) {
                    Text("Enter Immersive Space")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 60)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    func viewForSection(_ section: SidebarSection) -> some View {
        switch section {
        case .meetings:
            Text("Meetings View")
                .font(.title)
        case .chats:
            Text("Chats View")
                .font(.title)
        case .files:
            Text("Files View")
                .font(.title)
        case .aiAgents:
            Text("AI Agents View")
                .font(.title)
        case .multimodalRAG:
            MultimodalRAGView()   // Only shown if selected!
        }
    }
}
