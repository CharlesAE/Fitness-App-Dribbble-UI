//
//  CategoryCell.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/18/23.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    var data: Category? {
        didSet{
            manageData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        configViews()
        configConstraints()
        
    }
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints  = false
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .center
        title.font = .montserratBold(size: 20)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let overlay: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .black.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews(){
        addSubview(image)
        addSubview(overlay)
        overlay.addSubview(title)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            overlay.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: overlay.trailingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: overlay.bottomAnchor, multiplier: 0),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: title.trailingAnchor, multiplier: 1),
            
            image.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: image.bottomAnchor, multiplier: 0)
        ])
    }
    
    func manageData(){
        guard let category = data else { return }
        backgroundColor = UIColor(named: category.color)
        title.text = category.title
        image.image = UIImage(named: category.image)
    }
}
