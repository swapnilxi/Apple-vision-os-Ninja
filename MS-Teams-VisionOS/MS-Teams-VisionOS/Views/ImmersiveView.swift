import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @Environment(AppModel.self) private var appModel
    let exitImmersive: () -> Void
    @State private var environmentEntities: [Entity] = []

    var body: some View {
        ZStack {
            // Dynamic background based on selected environment
            environmentBackground
                .ignoresSafeArea()

            // 3D Environment Content
            RealityView { content in
                setupEnvironment(in: content)
            } update: { content in
                updateEnvironment(in: content)
            }
            .gesture(
                SpatialTapGesture()
                    .targetedToAnyEntity()
                    .onEnded { value in
                        handleEntityTap(value.entity)
                    }
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Environment indicator
                VStack(spacing: 10) {
                    Image(systemName: appModel.selectedEnvironment.icon)
                        .font(.system(size: 60))
                        .foregroundStyle(.white)
                        .shadow(radius: 10)

                    Text("\(appModel.selectedEnvironment.rawValue) Environment")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .padding(.top, 100)

                Spacer()

                // Controls
                VStack(spacing: 20) {
                    Text("Immersive Experience")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .shadow(radius: 10)

                    Text("Enjoy your \(appModel.selectedEnvironment.rawValue.lowercased()) workspace")
                        .font(.title2)
                        .foregroundStyle(Color.white.opacity(0.8))
                        .shadow(radius: 5)

                    Button("Back to 2D Window") {
                        exitImmersive()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .shadow(radius: 10)
                }
                .padding(.bottom, 100)
            }
        }
        .animation(.easeInOut(duration: 1.0), value: appModel.selectedEnvironment)
    }
    
    @ViewBuilder
    private var environmentBackground: some View {
        switch appModel.selectedEnvironment {
        case .office:
            // Professional office environment
            RadialGradient(
                colors: [
                    Color.blue.opacity(0.6),
                    Color.gray.opacity(0.4),
                    Color.black.opacity(0.8)
                ],
                center: .center,
                startRadius: 100,
                endRadius: 800
            )
            .overlay(
                // Subtle grid pattern for office feel
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.05), Color.clear],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            
        case .nature:
            // Natural environment
            RadialGradient(
                colors: [
                    Color.green.opacity(0.7),
                    Color.mint.opacity(0.5),
                    Color.teal.opacity(0.3),
                    Color.black.opacity(0.6)
                ],
                center: .center,
                startRadius: 150,
                endRadius: 1000
            )
            .overlay(
                // Organic flowing patterns
                EllipticalGradient(
                    colors: [Color.green.opacity(0.2), Color.clear],
                    center: .topTrailing,
                    startRadiusFraction: 0.1,
                    endRadiusFraction: 0.8
                )
            )
            
        case .space:
            // Space environment
            RadialGradient(
                colors: [
                    Color.purple.opacity(0.8),
                    Color.blue.opacity(0.6),
                    Color.black,
                    Color.black
                ],
                center: .center,
                startRadius: 50,
                endRadius: 1200
            )
            .overlay(
                // Stars effect
                ForEach(0..<50, id: \.self) { _ in
                    Circle()
                        .fill(Color.white.opacity(Double.random(in: 0.3...1.0)))
                        .frame(width: Double.random(in: 1...3))
                        .position(
                            x: Double.random(in: 0...1000),
                            y: Double.random(in: 0...800)
                        )
                }
            )
            
        case .cozy:
            // Warm, cozy environment
            RadialGradient(
                colors: [
                    Color.orange.opacity(0.6),
                    Color.yellow.opacity(0.4),
                    Color.red.opacity(0.3),
                    Color.brown.opacity(0.5)
                ],
                center: .center,
                startRadius: 100,
                endRadius: 900
            )
            .overlay(
                // Warm glow effect
                EllipticalGradient(
                    colors: [Color.orange.opacity(0.3), Color.clear],
                    center: .bottomLeading,
                    startRadiusFraction: 0.2,
                    endRadiusFraction: 1.0
                )
            )
            
        case .minimal:
            // Clean, minimal environment
            LinearGradient(
                colors: [
                    Color.white.opacity(0.1),
                    Color.gray.opacity(0.05),
                    Color.black.opacity(0.3)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .overlay(
                // Subtle geometric patterns
                Rectangle()
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.1), Color.clear],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(45))
                    .opacity(0.3)
            )
        }
    }

    // Setup 3D environment content with smooth transitions
    private func setupEnvironment(in content: RealityViewContent) {
        // Clear existing entities
        for entity in environmentEntities {
            content.remove(entity)
        }
        environmentEntities.removeAll()

        // Create environment-specific 3D content
        switch appModel.selectedEnvironment {
        case .office:
            setupOfficeEnvironment(in: content)
        case .nature:
            setupNatureEnvironment(in: content)
        case .space:
            setupSpaceEnvironment(in: content)
        case .cozy:
            setupCozyEnvironment(in: content)
        case .minimal:
            setupMinimalEnvironment(in: content)
        }
    }

    // Update environment when selection changes
    func updateEnvironment(in content: RealityViewContent) {
        setupEnvironment(in: content)
    }

    // Office Environment Setup
    private func setupOfficeEnvironment(in content: RealityViewContent) {
        // Create a desk
        let deskMesh = MeshResource.generateBox(size: [2, 0.1, 1], cornerRadius: 0.05)
        let deskMaterial = SimpleMaterial(color: UIColor.brown.withAlphaComponent(0.8), isMetallic: false)
        let desk = ModelEntity(mesh: deskMesh, materials: [deskMaterial])
        desk.position = [0, -0.5, -2]
        content.add(desk)
        environmentEntities.append(desk)

        // Add some office supplies
        let boxMesh = MeshResource.generateBox(size: [0.2, 0.2, 0.2])
        let boxMaterial = SimpleMaterial(color: .gray, isMetallic: true)
        let box = ModelEntity(mesh: boxMesh, materials: [boxMaterial])
        box.position = [0.3, -0.3, -2]
        box.name = "interactiveBox"

        // Add collision component for interaction
        let boxCollision = CollisionComponent(shapes: [.generateBox(size: [0.2, 0.2, 0.2])])
        box.components.set(boxCollision)

        // Add input target component
        let inputTarget = InputTargetComponent()
        box.components.set(inputTarget)

        content.add(box)
        environmentEntities.append(box)

        // Add ambient lighting
        let mainLight = DirectionalLight()
        mainLight.light.color = .white
        mainLight.light.intensity = 1000
        mainLight.position = [0, 2, 0]
        mainLight.look(at: [0, 0, 0], from: mainLight.position, relativeTo: nil)
        content.add(mainLight)
        environmentEntities.append(mainLight)

        // Add accent lighting
        let accentLight = PointLight()
        accentLight.light.color = UIColor.blue.withAlphaComponent(0.6)
        accentLight.light.intensity = 500
        accentLight.position = [1, 1, -1.5]
        content.add(accentLight)
        environmentEntities.append(accentLight)

        // Add ambient light for overall illumination
        let ambientLight = DirectionalLight()
        ambientLight.light.color = UIColor.white.withAlphaComponent(0.3)
        ambientLight.light.intensity = 300
        ambientLight.position = [0, -1, 0]
        ambientLight.look(at: [0, 1, 0], from: ambientLight.position, relativeTo: nil)
        content.add(ambientLight)
        environmentEntities.append(ambientLight)
    }

    // Nature Environment Setup
    private func setupNatureEnvironment(in content: RealityViewContent) {
        // Create trees
        for i in 0..<5 {
            let treeTrunk = MeshResource.generateCylinder(height: 1.5, radius: 0.1)
            let trunkMaterial = SimpleMaterial(color: .brown, isMetallic: false)
            let trunk = ModelEntity(mesh: treeTrunk, materials: [trunkMaterial])
            let angle = Float(i) * 2 * .pi / 5
            trunk.position = [cos(angle) * 3, -0.5, sin(angle) * 3]
            content.add(trunk)
            environmentEntities.append(trunk)

            let treeLeaves = MeshResource.generateSphere(radius: 0.8)
            let leavesMaterial = SimpleMaterial(color: UIColor.green.withAlphaComponent(0.7), isMetallic: false)
            let leaves = ModelEntity(mesh: treeLeaves, materials: [leavesMaterial])
            leaves.position = [cos(angle) * 3, 0.5, sin(angle) * 3]
            leaves.name = "treeLeaves\(i)"

            // Add collision and input target for interaction
            let leavesCollision = CollisionComponent(shapes: [.generateSphere(radius: 0.8)])
            leaves.components.set(leavesCollision)
            let leavesInputTarget = InputTargetComponent()
            leaves.components.set(leavesInputTarget)

            content.add(leaves)
            environmentEntities.append(leaves)
        }

        // Add ground plane
        let groundMesh = MeshResource.generatePlane(width: 10, depth: 10)
        let groundMaterial = SimpleMaterial(color: UIColor.green.withAlphaComponent(0.3), isMetallic: false)
        let ground = ModelEntity(mesh: groundMesh, materials: [groundMaterial])
        ground.position = [0, -1, 0]
        content.add(ground)
        environmentEntities.append(ground)

        // Add natural lighting
        let sunLight = DirectionalLight()
        sunLight.light.color = UIColor.yellow.withAlphaComponent(0.8)
        sunLight.light.intensity = 1500
        sunLight.position = [2, 3, 2]
        sunLight.look(at: [0, 0, 0], from: sunLight.position, relativeTo: nil)
        content.add(sunLight)
        environmentEntities.append(sunLight)

        // Add ambient forest light
        let ambientLight = DirectionalLight()
        ambientLight.light.color = UIColor.green.withAlphaComponent(0.2)
        ambientLight.light.intensity = 200
        ambientLight.position = [0, -2, 0]
        ambientLight.look(at: [0, 1, 0], from: ambientLight.position, relativeTo: nil)
        content.add(ambientLight)
        environmentEntities.append(ambientLight)

        // Add floating particles (leaves/pollen)
        addFloatingParticles(in: content, color: .green, count: 15)
    }

    // Space Environment Setup
    private func setupSpaceEnvironment(in content: RealityViewContent) {
        // Create planets
        let planetMesh = MeshResource.generateSphere(radius: 0.5)
        let planetMaterial = SimpleMaterial(color: .blue, isMetallic: false)
        let planet = ModelEntity(mesh: planetMesh, materials: [planetMaterial])
        planet.position = [2, 0, -3]
        planet.name = "planet"

        // Add collision and input target for interaction
        let planetCollision = CollisionComponent(shapes: [.generateSphere(radius: 0.5)])
        planet.components.set(planetCollision)
        let planetInputTarget = InputTargetComponent()
        planet.components.set(planetInputTarget)

        content.add(planet)
        environmentEntities.append(planet)

        // Add stars as small spheres
        for _ in 0..<20 {
            let starMesh = MeshResource.generateSphere(radius: 0.02)
            let starMaterial = SimpleMaterial(color: .white, isMetallic: false)
            let star = ModelEntity(mesh: starMesh, materials: [starMaterial])
            star.position = [
                Float.random(in: -5...5),
                Float.random(in: -3...3),
                Float.random(in: -5...5)
            ]
            content.add(star)
            environmentEntities.append(star)
        }

        // Add particle system for shooting stars
        addShootingStars(in: content)
    }

    // Cozy Environment Setup
    private func setupCozyEnvironment(in content: RealityViewContent) {
        // Create a fireplace
        let fireplaceMesh = MeshResource.generateBox(size: [1, 0.8, 0.3])
        let fireplaceMaterial = SimpleMaterial(color: UIColor.red.withAlphaComponent(0.8), isMetallic: false)
        let fireplace = ModelEntity(mesh: fireplaceMesh, materials: [fireplaceMaterial])
        fireplace.position = [0, -0.4, -2]
        content.add(fireplace)
        environmentEntities.append(fireplace)

        // Add some furniture
        let chairMesh = MeshResource.generateBox(size: [0.6, 0.8, 0.6])
        let chairMaterial = SimpleMaterial(color: UIColor.orange.withAlphaComponent(0.7), isMetallic: false)
        let chair = ModelEntity(mesh: chairMesh, materials: [chairMaterial])
        chair.position = [-1.5, -0.4, -1]
        content.add(chair)
        environmentEntities.append(chair)

        // Add warm lighting
        let warmLight = PointLight()
        warmLight.light.color = .orange
        warmLight.light.intensity = 2000
        warmLight.position = [0, 1, -2]
        content.add(warmLight)
        environmentEntities.append(warmLight)

        // Add fire sparks particles
        addFloatingParticles(in: content, color: .orange, count: 8)
    }

    // Minimal Environment Setup
    private func setupMinimalEnvironment(in content: RealityViewContent) {
        // Create geometric shapes
        let cubeMesh = MeshResource.generateBox(size: [0.5, 0.5, 0.5])
        let cubeMaterial = SimpleMaterial(color: UIColor.white.withAlphaComponent(0.5), isMetallic: true)
        let cube = ModelEntity(mesh: cubeMesh, materials: [cubeMaterial])
        cube.position = [0, 0, -2]
        content.add(cube)
        environmentEntities.append(cube)

        let sphereMesh = MeshResource.generateSphere(radius: 0.3)
        let sphereMaterial = SimpleMaterial(color: UIColor.gray.withAlphaComponent(0.5), isMetallic: true)
        let sphere = ModelEntity(mesh: sphereMesh, materials: [sphereMaterial])
        sphere.position = [1, 0.5, -2.5]
        content.add(sphere)
        environmentEntities.append(sphere)

        // Add minimal lighting
        let minimalLight = DirectionalLight()
        minimalLight.light.color = .white
        minimalLight.light.intensity = 500
        minimalLight.position = [0, 2, 0]
        minimalLight.look(at: [0, 0, 0], from: minimalLight.position, relativeTo: nil)
        content.add(minimalLight)
        environmentEntities.append(minimalLight)
    }


    // Particle system methods
    private func addShootingStars(in content: RealityViewContent) {
        // Create simple animated particles as fallback
        createSimpleShootingStars(in: content)
    }

    private func createSimpleShootingStars(in content: RealityViewContent) {
        // Create animated shooting star entities
        for _ in 0..<3 {
            let starMesh = MeshResource.generateSphere(radius: 0.01)
            let starMaterial = SimpleMaterial(color: UIColor.white.withAlphaComponent(0.8), isMetallic: false)
            let star = ModelEntity(mesh: starMesh, materials: [starMaterial])

            // Start position
            star.position = [
                Float.random(in: -4...4),
                Float.random(in: 1...3),
                Float.random(in: -4...4)
            ]

            content.add(star)
            environmentEntities.append(star)

            // Animate the shooting star
            var transform = star.transform
            transform.translation.y -= 4
            star.move(to: transform, relativeTo: star, duration: Double.random(in: 2...4), timingFunction: .easeInOut)
        }
    }

    private func addFloatingParticles(in content: RealityViewContent, color: Color, count: Int = 10) {
        for _ in 0..<count {
            let particleMesh = MeshResource.generateSphere(radius: 0.005)
            let uiColor = UIColor(color)
            let particleMaterial = SimpleMaterial(color: uiColor.withAlphaComponent(0.6), isMetallic: false)
            let particle = ModelEntity(mesh: particleMesh, materials: [particleMaterial])

            particle.position = [
                Float.random(in: -3...3),
                Float.random(in: -1...2),
                Float.random(in: -3...3)
            ]

            content.add(particle)
            environmentEntities.append(particle)

            // Add gentle floating animation
            var transform = particle.transform
            transform.translation.y += Float.random(in: 0.2...0.8)
            transform.translation.x += Float.random(in: -0.5...0.5)
            transform.translation.z += Float.random(in: -0.5...0.5)
            particle.move(to: transform, relativeTo: particle, duration: Double.random(in: 3...6), timingFunction: .easeInOut)
        }
    }

    // Handle entity interactions
    private func handleEntityTap(_ entity: Entity) {
        if entity.name == "interactiveBox" {
            // Simple rotation without complex animation
            entity.transform.rotation *= simd_quatf(angle: .pi * 0.5, axis: [0, 1, 0])
        } else if let name = entity.name, name.hasPrefix("treeLeaves") {
            // Simple scale effect
            entity.transform.scale *= 1.2
            // Reset after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                entity.transform.scale = [1.0, 1.0, 1.0]
            }
        } else if entity.name == "planet" {
            // Simple rotation
            entity.transform.rotation *= simd_quatf(angle: .pi * 0.25, axis: [0, 1, 0])
        }
    }
}
