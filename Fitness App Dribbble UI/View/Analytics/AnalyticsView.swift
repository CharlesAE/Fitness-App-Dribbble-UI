//
//  AnalyticsView.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/19/23.
//

import Foundation
import UIKit

class AnalyticsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        configViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let title: UILabel = {
        let title = UILabel()
        title.font = .montserratMedium(size: 16)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let val: UILabel = {
        let value = UILabel()
        value.font = .montserratBold(size: 30)
        value.textColor = .white
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    let progress: UIProgressView = {
        let progress = UIProgressView()
        progress.progressViewStyle = .default
        progress.isUserInteractionEnabled = false
        
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    func configViews(){
        addSubview(title)
        addSubview(val)
        addSubview(progress)
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 3),
            val.centerXAnchor.constraint(equalTo: centerXAnchor),
            val.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 3),
            
            progress.centerXAnchor.constraint(equalTo: centerXAnchor),
            progress.topAnchor.constraint(equalToSystemSpacingBelow: val.bottomAnchor, multiplier: 1),
            progress.widthAnchor.constraint(equalToConstant: 120),
            progress.heightAnchor.constraint(equalToConstant: 10)
            
        ])
        
    }
    
}
