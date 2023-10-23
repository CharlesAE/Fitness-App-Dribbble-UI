//
//  GradientShape.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/19/23.
//

import Foundation
import UIKit

class GradientCircle: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configCircle()

    }

    func configCircle(){
       
        let circle = UIBezierPath(ovalIn: CGRect(x: 20, y: 20, width: 200, height: 200))
        let circleTrack = UIBezierPath(ovalIn: CGRect(x: -100, y: 20, width: 200, height: 200))
        
        let trackShape = CAShapeLayer()
        trackShape.path = circleTrack.cgPath
        trackShape.lineWidth = 16
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.strokeColor = UIColor(named: "grayColor")?.cgColor
        layer.addSublayer(trackShape)
        
        let gradient = CAGradientLayer()
        gradient.type = .conic
        gradient.colors = [UIColor(named: "pinkColor")!.cgColor, UIColor(named: "blueColor")!.cgColor]
        gradient.startPoint = CGPoint(x: 0.3, y: 0.8)
        gradient.endPoint = CGPoint(x: 1, y: 0.1)
        gradient.frame = CGRect(x: -120, y: 0, width: 240, height: 240)
        self.layer.addSublayer(gradient)
        
        let shape = CAShapeLayer()
        shape.path = circle.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = 16
        gradient.mask = shape
        shape.strokeEnd = 0.7
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    
     
 
}
