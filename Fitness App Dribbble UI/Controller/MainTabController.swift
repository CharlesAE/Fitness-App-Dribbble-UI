//
//  MainTabController.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/17/23.
//

import Foundation
import UIKit

class MainTabController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = .white
        configTabBar()
        configConstraints()
    }
    
    var buttons: [TabButtonStack] = []
    
    let buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    let homeBtn: TabButtonStack = {
        let stack = TabButtonStack()
        let image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        stack.btn.setImage(image, for: .normal)
        stack.stack.spacing = 0
        stack.isSelected = true
        stack.hasDot = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let analyticsBtn: TabButtonStack = {
        let stack = TabButtonStack()
        let image = UIImage(named: "analytics")?.withRenderingMode(.alwaysTemplate)
        stack.btn.setImage(image, for: .normal)
        stack.stack.spacing = 0
        stack.isSelected = false
        stack.hasDot = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let profileBtn: TabButtonStack = {
        let stack = TabButtonStack()
        let image = UIImage(named: "profile")
        stack.btn.setImage(image, for: .normal)
        stack.btn.layer.cornerRadius = 25
        stack.btn.clipsToBounds = true
        stack.hasDot = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.origin.y = view.frame.height - 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        tabBarController?.selectedIndex = 0
        navigationController?.isNavigationBarHidden = true
      }
    
      override var selectedIndex: Int {
        didSet{
            guard let _ = viewControllers?[selectedIndex] else { return }
        }
    }
      
    override var selectedViewController: UIViewController?{
            didSet{
                switch selectedIndex {
                case 0:
                    buttons[0].isSelected = true
                    buttons[1].isSelected = false
                case 1:
                    buttons[1].isSelected = true
                    buttons[0].isSelected = false
                case 2:
                    buttons[1].isSelected = false
                    buttons[0].isSelected = false
                default:
                    buttons[0].isSelected = true
                    buttons[1].isSelected = false
                }
            }
        }
    
    
    func configTabBar(){
        let Home = UINavigationController(rootViewController: HomeController())
                
        let Analytics = UINavigationController(rootViewController: AnalyticsController())
        let Profile = UINavigationController(rootViewController: ProfileController())
        
        viewControllers = [Home, Analytics, Profile]
        buttons = [homeBtn, analyticsBtn,  profileBtn]
        
        tabBar.barTintColor = .white
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.white

        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 1.5
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.1
        
        tabBar.addSubview(buttonStackView)
        buttons.forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonStackView.trailingAnchor, multiplier: 6)
        ])
       
    }
    
}
