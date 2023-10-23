//
//  DropAnalyticsView.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/19/23.
//

import Foundation
import UIKit

class AnalyticsDropDown: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 0.9
        configViews()
        configConstraints()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "grayColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let icon : UIImageView = {
        var icon = UIImageView()
        icon.image = UIImage(systemName: "arrowtriangle.down.fill")?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = UIColor(named: "pinkColor")
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .montserratSemiBold(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func configViews(){
        addSubview(container)
        container.addSubview(label)
        container.addSubview(icon)
    }
    
    func configConstraints(){
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            container.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            container.heightAnchor.constraint(equalToConstant: 40),
            trailingAnchor.constraint(equalToSystemSpacingAfter: container.trailingAnchor, multiplier: 0),
            
            
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: container.leadingAnchor, multiplier: 2),
            
            icon.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            icon.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            icon.heightAnchor.constraint(equalToConstant: 12),
            icon.widthAnchor.constraint(equalToConstant: 16),
        ])
    }

}
