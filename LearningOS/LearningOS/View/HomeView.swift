//
//  HomeView.swift
//  LearningOS
//
//  Created by Abundent on 28/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		 MenuView(selectedImmersionStyle: .constant(.mixed))
    }
}

#Preview {
    HomeView()
}
