//
//  HomeController.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/17/23.
//

import Foundation
import UIKit

class HomeController: UICollectionViewController {
    let cellTitles = "CellTitles"
    let searchCell = "SearchCell"
    let workoutCell = "WorkoutCell"
    let categoryCell = "CategoryCell"
    let workouts = Workout.workouts
    let categories = Category.categories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(CellTitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellTitles)
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: searchCell)
        collectionView.register(WorkoutCell.self, forCellWithReuseIdentifier: workoutCell)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCell)
       }
    
    init() {
        let layout = UICollectionViewCompositionalLayout {
            (sectionNumber, _) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                return Layouts.shared.searchSection()
            }
            else if sectionNumber == 1 {
                return Layouts.shared.workoutSection()
            }
            else {
                return Layouts.shared.categoriesSection()
            }
        }
        super.init(collectionViewLayout: layout)
    }
           
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellTitles, for: indexPath) as! CellTitle
           var title: String?
           if indexPath.section == 1 {
               title = "Top workouts 💪🏾"
           } else if indexPath.section == 2 {
               title = "Categories"
           }
           header.label.text = title
           return header
       }
       
    
       override func numberOfSections(in collectionView: UICollectionView) -> Int {
           3
       }
       
       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if section == 0 {
               return 1
           }
           else if section == 1 {
               return workouts.count
           }
           else {
               return categories.count
           }
       }
           
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           switch indexPath.section {
           case 0:
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCell, for: indexPath) as! SearchCell
               return cell
           case 1:
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: workoutCell, for: indexPath) as! WorkoutCell
               cell.data = workouts[indexPath.row]
               return cell
           default:
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCell, for: indexPath) as! CategoryCell
               cell.data = categories[indexPath.row]
               return cell
            }
       }
        
}

