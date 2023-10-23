//
//  ProfileController.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/20/23.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
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
    
    let profile: UILabel = {
        let title = UILabel()
        title.text = "Profile"
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
    
    let profileView : ProfileView = {
       
        let profile = ProfileView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    func configViews(){
        view.addSubview(notificationButton)
        view.addSubview(backButton)
        view.addSubview(profile)
        view.addSubview(profileView)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
        notificationButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
        backButton.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
        profile.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
        profile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: notificationButton.trailingAnchor, multiplier: 3),
        notificationButton.heightAnchor.constraint(equalToConstant: 20),
        notificationButton.widthAnchor.constraint(equalToConstant: 18),
        backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
        backButton.heightAnchor.constraint(equalToConstant: 48),
        
        profileView.topAnchor.constraint(equalToSystemSpacingBelow: profile.bottomAnchor, multiplier: 4),
        profileView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: profileView.trailingAnchor, multiplier: 3),
        ])
    }
}
