//
//  LearningView.swift
//  LearningOS
//
//  Created by Abundent on 30/12/24.
//

import SwiftUI

struct LearningView: View {
		 @Environment(ViewModel.self) private var model

		 @State var axZoomIn: Bool = false
		 @State var axZoomOut: Bool = false
	var body: some View {
		EmptyView()
			
	}

//		 var body: some View {
//			  Earth(
//					earthConfiguration: model.orbitEarth,
//					satelliteConfiguration: [model.orbitSatellite],
//					moonConfiguration: model.orbitMoon
//			  ) { event in
//					if event.key.defaultValue == EarthEntity.AccessibilityActions.zoomIn.name.defaultValue {
//						 axZoomIn.toggle()
//					} else if event.key.defaultValue == EarthEntity.AccessibilityActions.zoomOut.name.defaultValue {
//						 axZoomOut.toggle()
//					}
//			  }
//			  .placementGestures(
//					initialPosition: Point3D([475, -1200.0, -1200.0]),
//					axZoomIn: axZoomIn,
//					axZoomOut: axZoomOut)
//			  .onDisappear {
//					model.isShowingOrbit = false
//			  }
//		 }
}

#Preview {
    LearningView()
}
