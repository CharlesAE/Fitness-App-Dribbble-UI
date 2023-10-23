//
//  Workout.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
struct Workout {
    let title: String
    let subtitle: String
    let duration: String
    let calories: String
    let image: String
    let color: String
    
    static let workouts:[Workout] = [
        Workout(title: "Weight Loss training", subtitle: "Full body workout", duration: "40 min", calories: "350 Cal", image: "weight_loss", color: "lightBlue"),
        Workout(title: "Cardio training", subtitle: "Cardiovascular workout", duration: "10 min", calories: "120 Cal", image: "cardio", color: "lightPink"),
        ]
}
