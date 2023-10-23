//
//  Category.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
struct Category {
    let title: String
    let image: String
    let color: String
    
    static let categories:[Category] = [
        Category(title: "Yoga", image: "yoga_mat", color: "blueColor"),
        Category(title: "Strength training", image: "strength", color: "pinkColor"),
        Category(title: "Functional training", image: "functional", color: "purpleColor")
    ]
}
