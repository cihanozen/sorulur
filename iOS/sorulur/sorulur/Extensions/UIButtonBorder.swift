//
//  UIButtonBorder.swift
//  sorulur
//
//  Created by Sinan Özman on 19.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    /// view rounder selected multiple corners
    ///
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = UIButton()
    ///    view.roundedButton()
    ///    ````
    func roundedButton(_ color: UIColor) {
        print("view rounded")
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 22
    }
}
