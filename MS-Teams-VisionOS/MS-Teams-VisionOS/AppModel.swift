//
//  AppModel.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 7/25/25.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"

    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
    
    // Environment selection
    enum Environment: String, CaseIterable {
        case office = "Office"
        case nature = "Nature"
        case space = "Space"
        case cozy = "Cozy Room"
        case minimal = "Minimal"
        
        var backgroundGradient: LinearGradient {
            switch self {
            case .office:
                return LinearGradient(
                    colors: [Color.blue.opacity(0.3), Color.gray.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            case .nature:
                return LinearGradient(
                    colors: [Color.green.opacity(0.4), Color.mint.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            case .space:
                return LinearGradient(
                    colors: [Color.black, Color.purple.opacity(0.5), Color.blue.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            case .cozy:
                return LinearGradient(
                    colors: [Color.orange.opacity(0.3), Color.yellow.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            case .minimal:
                return LinearGradient(
                    colors: [Color.white.opacity(0.1), Color.gray.opacity(0.05)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        
        var icon: String {
            switch self {
            case .office: return "building.2"
            case .nature: return "leaf"
            case .space: return "moon.stars"
            case .cozy: return "house"
            case .minimal: return "circle"
            }
        }
    }
    
    var selectedEnvironment: Environment = .office
}
