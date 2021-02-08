//
//  UITableViewCell+Extension.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import Foundation
import UIKit

extension UITableViewCell {
    /// Return Nib
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    /// Return Identifier
    public static var identifier: String {
        return String(describing: self)
    }
}
