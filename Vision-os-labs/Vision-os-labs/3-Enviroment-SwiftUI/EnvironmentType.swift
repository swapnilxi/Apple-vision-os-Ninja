//
//  EnvironmentType.swift
//  Vision-os-labs
//
//  Created by swapnil on 8/16/25.
//

import SwiftUI

// Step 1: Define our list of possible environments
enum EnvironmentType: String {
    case forest
    case office
    case calm
    case cozyBedroom
    case none // The default state
}


// Step 2: Create the key, now using our enum
private struct CurrentEnvironmentKey: EnvironmentKey {
    // The value is now our list of choices
    typealias Value = EnvironmentType

    // The default value when the app launches
    static var defaultValue: EnvironmentType = .none
}

// Step 3: Extend EnvironmentValues to add our property
extension EnvironmentValues {
    var currentEnvironment: EnvironmentType {
        get { self[CurrentEnvironmentKey.self] }
        set { self[CurrentEnvironmentKey.self] = newValue }
    }
}
