import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var appModel
    @State private var isImmersive = false
    // Optionally, track which sidebar button is active
    @State private var selectedSidebar: SidebarSection? = .meetings

    var body: some View {
        if isImmersive {
            ImmersiveView(exitImmersive: { self.isImmersive = false })
        } else {
            HStack(spacing: 0) {
                SidebarView(
                    selectedSidebar: $selectedSidebar,
                    onEnterImmersive: {
                        // Trigger immersive mode here, e.g.
                        isImmersive = true
                    }
                )
                    .frame(width: 180)
                    .background(Color.gray.opacity(0.08))
                Divider()
                MainAreaView(
                    selectedSidebar: selectedSidebar,
                    enterImmersive: { self.isImmersive = true }
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
    }
}




