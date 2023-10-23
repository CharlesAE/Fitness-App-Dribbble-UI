//
//  TabButtonStack.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/19/23.
//

import Foundation
import UIKit

class TabButtonStack: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    var color = UIColor(named: "pinkColor")
    
    var hasDot: Bool? {
        didSet {
            if(hasDot!) {
                configDot()
                constraintDot()
            }
            else {
                configViews()
                configConstraints()
            }
            
        }
    }
    
    var isSelected: Bool? {
        didSet{
            btn.tintColor = isSelected! ? color : .black
            dot.textColor = isSelected! ? color : .black
        }
    }
    
    let stack: UIStackView = {
        let home = UIStackView()
        home.axis = .vertical
        home.alignment = .center
        home.translatesAutoresizingMaskIntoConstraints = false
        return home
    }()
    
    let dot: UILabel = {
        let dot = UILabel()
        dot.text = "."
        dot.font = .montserratBold(size: 25)
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }()
    
    let btn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func configDot(){
        addSubview(stack)
            [btn, dot].forEach {
                stack.addArrangedSubview($0)
            }
    }
    
    
    func constraintDot() {
        NSLayoutConstraint.activate([
        stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
        stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
        trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 0),
        btn.widthAnchor.constraint(equalToConstant: 24),
        btn.heightAnchor.constraint(equalToConstant: 24),
        dot.topAnchor.constraint(equalToSystemSpacingBelow: btn.bottomAnchor, multiplier: 0)
        ])
    }
    
    func configViews(){
        addSubview(stack)
        stack.addArrangedSubview(btn)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
        stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
        stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
        trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 0),
        btn.centerYAnchor.constraint(equalTo: stack.centerYAnchor),
        btn.widthAnchor.constraint(equalToConstant: 50),
        btn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
