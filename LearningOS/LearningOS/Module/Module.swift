//
//  Module.swift
//  LearningOS
//
//  Created by Abundent on 16/01/25.
//

import SwiftUI
import Foundation

enum Module: String, Identifiable {
	case linkedin, portfolio
	case persoalBranding = "Personal Branding"
	
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
		case .persoalBranding:
			 String(localized: "Personal Brading ", comment: "The title of a module in the app.")
		}
	}
	
	
	
	var subTitle: String {
		switch self {
		case .linkedin:
			return "Build a strong online presence on Linkedin"
		case .portfolio:
			return "Showcase your skills and projects"
		case .persoalBranding:
			return "Develop a compelling personal brand"
		}
	}
    
}


