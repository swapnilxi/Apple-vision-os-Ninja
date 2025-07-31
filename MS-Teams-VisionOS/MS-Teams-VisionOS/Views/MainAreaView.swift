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
        VStack(alignment: .center) {
            if let section = selectedSidebar {
                Text("Selected: \(section.rawValue)")
                    .font(.title)
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
