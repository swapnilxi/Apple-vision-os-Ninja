//
//  AppEnvironmentKey.swift
//  BooksOrbit
//
//  Created by swapnil on 12/30/25.
//

private struct AppEnvironmentKey: EnvironmentKey {
    static let defaultValue: AppEnvironment = .shared
}

extension EnvironmentValues {
    var appEnvironment: AppEnvironment {
        get { self[AppEnvironmentKey.self] }
        set { self[AppEnvironmentKey.self] = newValue }
    }
}
