//
//  CellTitle.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
import UIKit

class CellTitle: UICollectionReusableView {
    
    var label : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "cellTitleColor")
        label.font = .montserratBold(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configView(){
        addSubview(label)
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            label.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
        ])
    }
}
