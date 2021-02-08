//
//  UIFont+Extension.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import Foundation
import UIKit

extension UIFont {
    
    struct RobotoSlab {
        static func regular(size: CGFloat) -> UIFont {
            guard let font = UIFont(name: "RobotoSlab-Regular", size: size) else {
                return UIFont.systemFont(ofSize:size)
            }
            
            return font
        }
        
        static func medium(size: CGFloat) -> UIFont {
            guard let font = UIFont(name: "RobotoSlab-Medium", size: size) else {
                return UIFont.systemFont(ofSize:size)
            }
            
            return font
        }
        
        static func semibold(size: CGFloat) -> UIFont {
            guard let font = UIFont(name: "RobotoSlab-SemiBold", size: size) else {
                return UIFont.systemFont(ofSize:size)
            }
            
            return font
        }
        
        static func bold(size: CGFloat) -> UIFont {
            guard let font = UIFont(name: "RobotoSlab-Bold", size: size) else {
                return UIFont.systemFont(ofSize:size)
            }
            return font
        }
    }
}

