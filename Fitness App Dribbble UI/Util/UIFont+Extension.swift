//
//  UIFont+Extension.swift
//  Fitness App Dribbble UI
//
//  Created by Charles Edwards on 10/20/23.
//

import Foundation
import UIKit
extension UIFont {
    
    static func montserratMedium(size: CGFloat) -> UIFont? {
        return UIFont(name: "Montserrat-Medium", size: size)
    }
    
    static func montserratSemiBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "Montserrat-SemiBold", size: size)
    }
    
    
    static func montserrat(size: CGFloat) -> UIFont? {
        return UIFont(name: "Montserrat-Regular", size: size)
    }
    
    static func montserratBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "Montserrat-ExtraBold", size: size)
    }
}
