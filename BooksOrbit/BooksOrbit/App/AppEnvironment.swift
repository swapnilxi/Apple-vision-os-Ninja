//
//  AppEnvironment.swift
//  BooksOrbit
//
//  Created by swapnil on 12/30/25.
//

final class AppEnvironment {

    static let shared = AppEnvironment()

    // Core services (to be implemented later)
    let apiClient: APIClient
    let bookStore: BookStoring
    let recommendationEngine: RecommendationEngine

    private init() {
        self.apiClient = APIClient()
        self.bookStore = FileBookStore()
        self.recommendationEngine = RecommendationEngine()
    }
}
