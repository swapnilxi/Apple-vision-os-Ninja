//
//  MultiModalRAG.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 8/4/25.
//

import SwiftUI

struct MultimodalRAGView: View {
    @Environment(AppModel.self) private var appModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Multimodal RAG")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Connect, search, and generate across files, chat, and more using AI-powered retrieval-augmented generation.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                // Environment Selector
                EnvironmentSelector()
                
                // Chat Interface
                ChatUI()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(appModel.selectedEnvironment.backgroundGradient)
                            .opacity(0.3)
                    )
            }
            .padding()
        }
        .background(
            // Global background that changes with environment
            appModel.selectedEnvironment.backgroundGradient
                .opacity(0.1)
                .ignoresSafeArea()
        )
    }
}
