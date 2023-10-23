//
//  WorkoutCell.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
import UIKit

class WorkoutCell: UICollectionViewCell {
    
    var data: Workout? {
        didSet{
            manageData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        configConstraints()
        layer.cornerRadius = 32
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints  = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textColor = .black
        title.font = .systemFont(ofSize: 28, weight: .heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.numberOfLines = 0
        subtitle.textColor = UIColor(named: "subtitleColor")
        subtitle.font = .montserratMedium(size: 16)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    let duration: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 0.3
        view.backgroundColor = .white.withAlphaComponent(0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let play : UIImageView = {
        var image = UIImageView()
        image.image =  UIImage(systemName: "arrowtriangle.right.fill")
        image.tintColor = .black
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let durationLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textColor = .black
        title.font = .montserratSemiBold(size: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let calorie: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 0.3
        view.backgroundColor = .white.withAlphaComponent(0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let flame : UILabel = {
        var flame = UILabel()
        flame.text =  "🔥"
        flame.font = .preferredFont(forTextStyle: .body)
        flame.translatesAutoresizingMaskIntoConstraints = false
        return flame
    }()
    
    let calorieLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textColor = .black
        title.font = .montserratSemiBold(size: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    
    func configViews(){
        addSubview(image)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(duration)
        addSubview(calorie)
        duration.addSubview(play)
        duration.addSubview(durationLabel)
        
        calorie.addSubview(flame)
        calorie.addSubview(calorieLabel)
        
        
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 4),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            
            
            duration.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            duration.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            duration.heightAnchor.constraint(equalToConstant: 40),
            duration.widthAnchor.constraint(equalToConstant: 110),
            
            play.centerYAnchor.constraint(equalTo: duration.centerYAnchor),
            play.leadingAnchor.constraint(equalToSystemSpacingAfter: duration.leadingAnchor, multiplier: 2),
            play.heightAnchor.constraint(equalToConstant: 16),
            play.widthAnchor.constraint(equalToConstant: 16),
            
            durationLabel.centerYAnchor.constraint(equalTo: duration.centerYAnchor),
            durationLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: play.trailingAnchor, multiplier: 1),
            
            calorie.centerYAnchor.constraint(equalTo: duration.centerYAnchor),
            calorie.leadingAnchor.constraint(equalToSystemSpacingAfter: duration.trailingAnchor, multiplier: 2),
            calorie.heightAnchor.constraint(equalToConstant: 40),
            calorie.widthAnchor.constraint(equalToConstant: 120),
            
            flame.centerYAnchor.constraint(equalTo: calorie.centerYAnchor),
            flame.leadingAnchor.constraint(equalToSystemSpacingAfter: calorie.leadingAnchor, multiplier: 2),
            
            calorieLabel.centerYAnchor.constraint(equalTo: calorie.centerYAnchor),
            calorieLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: flame.trailingAnchor, multiplier: 1),
            
            image.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            image.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 75),
            trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: image.bottomAnchor, multiplier: 0)
            
            
        ])
    }
    
    
    func manageData(){
        guard let item = data else { return }
        backgroundColor = UIColor(named: item.color)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        image.image = UIImage(named: item.image)
        durationLabel.text = item.duration
        calorieLabel.text = item.calories
        
    }
}
