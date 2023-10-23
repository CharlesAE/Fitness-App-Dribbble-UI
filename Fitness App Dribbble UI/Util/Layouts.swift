//
//  Layouts.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
import UIKit

class Layouts {
    
    static let shared = Layouts()
    
    let titleConfig : NSCollectionLayoutBoundarySupplementaryItem = .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
    
    
    func searchSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 24
        return section
    }
    
    func workoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(220)), subitems: [item])
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
                
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 34
        section.contentInsets.top = 34
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [
            titleConfig
        ]
                
        return section
    }
    
    
    
    
    func categoriesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(200)), subitems: [item])
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
                
                
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.top = 34
        section.boundarySupplementaryItems = [
            titleConfig
        ]
                
        return section
    }
    
}
