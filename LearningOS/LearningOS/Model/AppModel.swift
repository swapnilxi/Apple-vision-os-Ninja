//
//  AppModel.swift
//  LearningOS
//
//  Created by Abundent on 06/01/25.
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
	 var currentSpaceID: String?  
	// Use separate queue for thread-safe mutations
		 private let accessQueue = DispatchQueue(label: "AppModelAccessQueue")
		 
	func updateState(_ newState: ImmersiveSpaceState, spaceID: String?) {
		accessQueue.sync {
			self.immersiveSpaceState = newState
			self.currentSpaceID = spaceID
		}
	}
	
}
