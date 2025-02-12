//
//  ViewModel.swift
//  LearningOS
//
//  Created by Abundent on 31/12/24.
//

import SwiftUI

/// ViewModel to manage the state and logic for courses, learning, and teaching views.
@Observable
class ViewModel {
	var navigationPath: [Module] = []
	var titleText: String = ""
	//Mark:- LinkedinView
	var isShowingLinkedinView: Bool = false
	var isShowingPortfolioView: Bool = false
	var isShowingPersonalBrandingView: Bool = false
	
	 // MARK: - Navigation


	 var isTitleFinished: Bool = false
	 var finalTitle: String = String(localized: "Hello Learning", comment: "The New way of Learning")
	/*
	 // MARK: - Course Data
	 @Published var courses: [Course] = []
	 @Published var selectedCourse: Course? = nil
	 @Published var isCourseDetailsVisible: Bool = false

	 // MARK: - Learning Views
	 @Published var currentLesson: Lesson? = nil
	 @Published var lessonProgress: Float = 0.0
	 @Published var isLessonCompleted: Bool = false

	 // MARK: - Teaching Views
	 @Published var teachingModeActive: Bool = false
	 @Published var isStudentEngaged: Bool = false

	 // MARK: - Immersive Environment
	 var isShowingGlobe: Bool = false
	 var globeEarth: EarthEntity.Configuration = .globeEarthDefault
	 var isGlobeRotating: Bool = false
	 var globeTilt: GlobeTilt = .none

	 // MARK: - Methods to handle interactions
	 func toggleGlobeRotation() {
		  isGlobeRotating.toggle()
	 }

	 func selectCourse(_ course: Course) {
		  selectedCourse = course
		  isCourseDetailsVisible = true
	 }

	 func startLesson(_ lesson: Lesson) {
		  currentLesson = lesson
		  lessonProgress = 0.0
		  isLessonCompleted = false
	 }

	 func updateLessonProgress(_ progress: Float) {
		  lessonProgress = progress
		  if progress >= 1.0 {
				isLessonCompleted = true
		  }
	 }

	 func activateTeachingMode() {
		  teachingModeActive = true
	 }

	 func deactivateTeachingMode() {
		  teachingModeActive = false
	 }
	  
	  */
}


