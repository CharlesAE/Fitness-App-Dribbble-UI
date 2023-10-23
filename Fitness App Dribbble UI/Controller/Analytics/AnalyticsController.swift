//
//  AnalyticsController.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/17/23.
//

import Foundation
import UIKit

class AnalyticsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configViews()
        configConstraints()
    }
    
    let backButton: UIButton = {
        var button = UIButton()
        let image = UIImage(systemName: "chevron.backward")
        button.tintColor = .black
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let analyticsTitle: UILabel = {
        let title = UILabel()
        title.text = "Analytics"
        title.textColor = .black
        title.font = .montserratSemiBold(size: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let notificationButton: UIButton = {
        var button = UIButton()
        let image = UIImage(named: "notification")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Today"
        label.font = .montserratBold(size: 24)
        label.textColor = UIColor(named: "pinkColor")
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thu 19 Oct"
        label.font = .montserratBold(size: 32)
        label.textColor = .black
        return label
    }()
    
    let calorieDrop: AnalyticsDropDown = {
        let drop = AnalyticsDropDown()
        drop.label.text = "Calories"
        drop.translatesAutoresizingMaskIntoConstraints = false
        return drop
    }()
    
    let todayDrop: AnalyticsDropDown = {
        let drop = AnalyticsDropDown()
        drop.label.text = "Today"
        drop.translatesAutoresizingMaskIntoConstraints = false
        return drop
    }()
    
    let gradientCircle : GradientCircle = {
        let circle = GradientCircle()
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    let activeLabel : UILabel = {
       let active = UILabel()
        active.text = "Active calories"
        active.font = .montserratSemiBold(size: 16)
        active.translatesAutoresizingMaskIntoConstraints = false
        active.textColor = UIColor(named: "subtitleColor")
        return active
    }()
    let caloriesLabel : UILabel = {
       let calories = UILabel()
        calories.translatesAutoresizingMaskIntoConstraints = false
        calories.textColor = .black
        return calories
    }()
    
    let analyticsStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let trainingAnalytics: AnalyticsView = {
        let training = AnalyticsView()
        training.title.text = "Training time"
        training.val.text = "45 min"
        training.progress.progress = 0.4
        training.progress.progressTintColor = UIColor(named: "blueColor")
        training.progress.trackTintColor = .white
        training.backgroundColor = UIColor(named: "purpleColor")
        training.translatesAutoresizingMaskIntoConstraints = false
        return training
    }()
    
    let stepsAnalytics: AnalyticsView = {
        let steps = AnalyticsView()
        steps.title.text = "Steps"
        steps.val.text = "8670"
        steps.progress.progress = 0.7
        steps.progress.progressTintColor = UIColor(named: "pinkColor")
        steps.progress.trackTintColor = .white
        steps.backgroundColor = UIColor(named: "tealColor")
        steps.translatesAutoresizingMaskIntoConstraints = false
        return steps
    }()
    
    func configViews(){
        view.addSubview(notificationButton)
        view.addSubview(backButton)
        view.addSubview(analyticsTitle)
        
        view.addSubview(todayLabel)
        view.addSubview(dateLabel)
        
        view.addSubview(calorieDrop)
        view.addSubview(todayDrop)
        view.addSubview(gradientCircle)
        
        view.addSubview(activeLabel)
        view.addSubview(caloriesLabel)
        view.addSubview(analyticsStackView)
        [trainingAnalytics, stepsAnalytics].forEach {
            analyticsStackView.addArrangedSubview($0)
        }
        caloriesLabel.attributedText = configAttributedTitle("536", " Cal")
    }
    
    func configAttributedTitle(_ num: String,_ cal: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: num, attributes: [.font: UIFont.montserratBold(size: 40)!,.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: cal, attributes: [.font: UIFont.montserratSemiBold(size: 22)!, .foregroundColor: UIColor.black]))
                return attributedText
            }
    
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            notificationButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            backButton.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
            analyticsTitle.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
            analyticsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: notificationButton.trailingAnchor, multiplier: 3),
            notificationButton.heightAnchor.constraint(equalToConstant: 20),
            notificationButton.widthAnchor.constraint(equalToConstant: 18),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            
            
            todayLabel.topAnchor.constraint(equalToSystemSpacingBelow: notificationButton.bottomAnchor, multiplier: 3),
            todayLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: todayLabel.bottomAnchor, multiplier: 1),
            dateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            
            
            calorieDrop.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 3),
            calorieDrop.widthAnchor.constraint(equalToConstant: 120),
            calorieDrop.heightAnchor.constraint(equalToConstant: 40),
            calorieDrop.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            
            todayDrop.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 3),
            todayDrop.widthAnchor.constraint(equalToConstant: 100),
            todayDrop.heightAnchor.constraint(equalToConstant: 40),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: todayDrop.trailingAnchor, multiplier: 3),
            
            activeLabel.topAnchor.constraint(equalToSystemSpacingBelow: gradientCircle.topAnchor, multiplier: 10),
            activeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caloriesLabel.topAnchor.constraint(equalToSystemSpacingBelow: activeLabel.bottomAnchor, multiplier: 2),
            caloriesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gradientCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gradientCircle.topAnchor.constraint(equalToSystemSpacingBelow: todayDrop.bottomAnchor, multiplier: 0),
            
            analyticsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            analyticsStackView.topAnchor.constraint(equalToSystemSpacingBelow: caloriesLabel.bottomAnchor, multiplier: 12),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: analyticsStackView.trailingAnchor, multiplier: 3),
            
            trainingAnalytics.leadingAnchor.constraint(equalToSystemSpacingAfter: analyticsStackView.leadingAnchor, multiplier: 0),
            trainingAnalytics.heightAnchor.constraint(equalToConstant: 150),
            
            
            stepsAnalytics.heightAnchor.constraint(equalToConstant: 150),
            stepsAnalytics.centerYAnchor.constraint(equalTo: analyticsStackView.centerYAnchor),
            analyticsStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: stepsAnalytics.trailingAnchor, multiplier: 0),
            
        ])
    }
}


