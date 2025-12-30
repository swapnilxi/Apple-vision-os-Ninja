//
//  BooksOrbitApp.swift
//  BooksOrbit
//
//  Created by swapnil on 12/29/25.
//

import SwiftUI

@main
struct BooksOrbitApp: App {

    let environment = AppEnvironment.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.appEnvironment, environment)
        }
    }
}
