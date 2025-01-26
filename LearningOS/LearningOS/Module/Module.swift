//
//  Module.swift
//  LearningOS
//
//  Created by Abundent on 16/01/25.
//

import SwiftUI
import Foundation

enum Module: String, Identifiable, CaseIterable, Equatable {
	//linkedin is window , portfolio- immersive-mixed
	//personalBranding - full
	case linkedin, portfolio
	case personalBranding = "Personal Branding"
	
	//returning case as identifier
	//can be written as String { rawValue } , var id: String { "module_\(rawValue)" }
	var id: Self{self}
	var name: String { rawValue.capitalized }
	
	
	var heading: String {
		switch self {
		case .linkedin:
			 String(localized: "Linkedin", comment: "The title of a module in the app.")
		case .portfolio:
			 String(localized: "Portfolio", comment: "The title of a module in the app.")
		case .personalBranding:
			 String(localized: "Personal Brading ", comment: "The title of a module in the app.")
		}
	}
	
	
	
	var subTitle: String {
		switch self {
		case .linkedin:
			return "Build a strong online presence on Linkedin"
		case .portfolio:
			return "Showcase your skills and projects"
		case .personalBranding:
			return "Develop a compelling personal brand"
		}
	}
	
	
	var overview: String {
		 switch self {
		 case .linkedin:
			  String(localized: "Linkedin Module challenge is about 21 days challenge where we will learn task how to make linkedin better\n\ninvidiual task will be there for each day", comment: "Linkedin text is window module, will show in Linkedin Module")
			 
		 case .portfolio:
			  String(localized: "The Moon orbits the Earth in an elliptical orbit. It’s the most visible object in our sky, but it’s farther from us than you might think: on average, it’s about 385,000 kilometers away!\n\nMost satellites orbit Earth in a tighter orbit — some only a few hundred miles above Earth’s surface. Satellites in lower orbits circle us faster: the Hubble Telescope is approximately 534 kilometers from Earth and completes almost 15 orbits in a day, while geostationary satellites circle Earth just once in 24 hours from about 36,000 kilometers away.\n\nGet up close with different types of orbits to learn how these objects move in space relative to Earth.", comment: "portfolio text is mixed immersive module, will show in portfolio Module")
			 
		 case .personalBranding:
			  String(localized: "Every 365¼ days, Earth and its satellites completely orbit the Sun — the star that anchors our solar system. It’s a journey of about 940 million kilometers a year!\n\nOn its journey, the Earth moves counter-clockwise in a slightly elliptical orbit. It travels a path called the ecliptic plane — an important part of how we navigate through our solar system.\n\nWant to explore Earth’s orbit in detail? Take a trip to the solar system and watch how Earth and its satellites move around the Sun.", comment: "Personal Branding text is immersive module, will show in personal Branding Module")
		 }
	}
    
}


