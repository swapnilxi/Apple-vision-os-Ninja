import SwiftUI
import RealityKit



// MARK: - ViewModel
@MainActor
final class PostsModule: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetch() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            posts = try JSONDecoder().decode([Post].self, from: data)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

// MARK: - SwiftUI View (2D list)
struct PostsListView: View {
    @ObservedObject var module: PostsModule

    var body: some View {
        Group {
            if module.isLoading {
                ProgressView("Loading…")
            } else if let err = module.errorMessage {
                Text("Error: \(err)").foregroundColor(.red)
            } else {
                ScrollView {
                    ForEach(module.posts.prefix(5)) { post in
                        Text(post.title)
                            .font(.headline)
                            .padding()
                            .glassBackgroundEffect()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
        }
        .frame(width: 500, height: 300)
    }
}

// MARK: - RealityKit View (3D floating titles)
struct PostsRealityView: View {
    @ObservedObject var module: PostsModule

    var body: some View {
        RealityView { content in
            content.entities.removeAll()
            for (i, post) in module.posts.prefix(5).enumerated() {
                let mesh = MeshResource.generateText(
                    post.title,
                    extrusionDepth: 0.02,
                    font: .systemFont(ofSize: 0.12)
                )
                let entity = ModelEntity(
                    mesh: mesh,
                    materials: [SimpleMaterial(color: .cyan, isMetallic: true)]
                )
                entity.position = [0, Float(-i) * 0.25, -1.0]
                content.add(entity)
            }
        }
        .frame(width: 600, height: 400)
        .cornerRadius(20)
        .glassBackgroundEffect()
    }
}

// MARK: - Combined Scene for re-use
struct PostsScene: View {
    @StateObject private var module = PostsModule()

    var body: some View {
        VStack(spacing: 40) {
            PostsListView(module: module)
            PostsRealityView(module: module)
        }
        .task { await module.fetch() }
    }
}
