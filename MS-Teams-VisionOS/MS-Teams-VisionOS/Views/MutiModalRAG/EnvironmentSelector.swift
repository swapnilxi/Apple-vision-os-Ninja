//
//  EnvironmentSelector.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 8/9/25.
//

import SwiftUI

struct EnvironmentSelector: View {
    @Environment(AppModel.self) private var appModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Choose Environment")
                .font(.headline)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                ForEach(AppModel.Environment.allCases, id: \.self) { environment in
                    EnvironmentButton(
                        environment: environment,
                        isSelected: appModel.selectedEnvironment == environment
                    ) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            appModel.selectedEnvironment = environment
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground).opacity(0.8))
                .shadow(radius: 2)
        )
    }
}

struct EnvironmentButton: View {
    let environment: AppModel.Environment
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: environment.icon)
                    .font(.title2)
                    .foregroundColor(isSelected ? .white : .primary)
                
                Text(environment.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .primary)
                    .multilineTextAlignment(.center)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Color.blue : Color(.systemGray6))
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

#Preview {
    EnvironmentSelector()
        .environment(AppModel())
}
