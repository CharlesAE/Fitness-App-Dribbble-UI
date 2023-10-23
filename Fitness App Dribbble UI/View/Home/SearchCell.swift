//
//  SearchCell.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
import UIKit

class SearchCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let menuButton: UIButton = {
        var button = UIButton()
        let image = UIImage(named: "menu")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Browse"
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
    
    let searchView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "searchBG")
        v.layer.cornerRadius = 25
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let searchIcon : UIImageView = {
        var icon = UIImageView()
        icon.image =  UIImage(named: "search")
        icon.tintColor = .systemGray
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let filterIcon : UIImageView = {
        var icon = UIImageView()
        icon.image =  UIImage(systemName: "slider.horizontal.3")
        icon.tintColor = .systemGray
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    let searchTextField: UITextField = {
        var text = UITextField()
        text.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.font: UIFont.montserratMedium(size: 18)!,.foregroundColor: UIColor.systemGray])
        text.borderStyle = .none
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    func configViews(){
        addSubview(notificationButton)
        addSubview(menuButton)
        addSubview(title)
        addSubview(searchView)
        searchView.addSubview(searchIcon)
        searchView.addSubview(filterIcon)
        searchView.addSubview(searchTextField)
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            notificationButton.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            menuButton.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
            title.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: notificationButton.trailingAnchor, multiplier: 3),
            notificationButton.heightAnchor.constraint(equalToConstant: 20),
            notificationButton.widthAnchor.constraint(equalToConstant: 18),
            menuButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            menuButton.widthAnchor.constraint(equalToConstant: 25),
            
            
            searchView.topAnchor.constraint(equalTo: notificationButton.bottomAnchor, constant: 24),
            searchView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            trailingAnchor.constraint(equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 2),
            
            searchIcon.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalToSystemSpacingAfter: searchView.leadingAnchor, multiplier: 2),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            
            searchTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: searchIcon.trailingAnchor, multiplier: 1),
            
            filterIcon.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            filterIcon.heightAnchor.constraint(equalToConstant: 24),
            filterIcon.widthAnchor.constraint(equalToConstant: 24),
            searchView.trailingAnchor.constraint(equalToSystemSpacingAfter: filterIcon.trailingAnchor, multiplier: 2)
        ])
    }
}
