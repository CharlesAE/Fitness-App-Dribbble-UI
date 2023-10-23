//
//  ProfileView.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/20/23.
//

import Foundation
import UIKit

class ProfileView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = 6
        configViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profile : UIImageView = {
       
        let img = UIImageView()
        img.image = UIImage(named: "profile")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 16
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let name: UILabel = {
        let name = UILabel()
        name.text = "Charles Edwards"
        name.font = .montserratBold(size: 18)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let email: UILabel = {
        let email = UILabel()
        email.text = "hello@charlesae.dev"
        email.textColor = UIColor(named: "blueColor")
        email.font = .montserrat(size: 15)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let bio: UILabel = {
        let bio = UILabel()
        bio.text = "Software Engineer, primarily focused on iOS & NextJS development."
        bio.font = .montserrat(size: 15)
        bio.textColor = .black
        bio.numberOfLines = 0
        bio.lineBreakMode = .byWordWrapping
        bio.translatesAutoresizingMaskIntoConstraints = false
        return bio
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    func configViews(){
        addSubview(profile)
        addSubview(stack)
        [name, email, bio].forEach {
            stack.addArrangedSubview($0)
        }
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            profile.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            profile.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            profile.heightAnchor.constraint(equalToConstant: 110),
            profile.widthAnchor.constraint(equalToConstant: 110),
            bottomAnchor.constraint(equalToSystemSpacingBelow: profile.bottomAnchor, multiplier: 2),
            
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: profile.trailingAnchor, multiplier: 1),
            stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            
            stack.trailingAnchor.constraint(equalToSystemSpacingAfter: bio.trailingAnchor, multiplier: 0)
        ])
    }
}
