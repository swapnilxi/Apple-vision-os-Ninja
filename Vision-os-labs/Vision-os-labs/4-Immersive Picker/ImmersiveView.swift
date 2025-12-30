//
//  ImmersiveView.swift
//  Vision-os-labs
//
//  Created by swapnil on 9/16/25.
//

import SwiftUI

struct ImmersiveView: View {
    @State private var isImmersiveSpaceOpened = false

        @Environment(\.openImmersiveSpace) var openImmersiveSpace
        @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

        var body: some View {
            Button(isImmersiveSpaceOpened ? "Exit Immersive Space" : "Show Immersive Space", role: isImmersiveSpaceOpened ? .destructive : .none) {
                Task {
                    if isImmersiveSpaceOpened {
                        await dismissImmersiveSpace()
                        isImmersiveSpaceOpened = false
                    } else {
                        let result = await openImmersiveSpace(id: "ImmersiveSpace")
                        if result == .opened {
                            isImmersiveSpaceOpened = true
                        }
                    }
                }
            }
        }
}

#Preview {
    ImmersiveView()
}
