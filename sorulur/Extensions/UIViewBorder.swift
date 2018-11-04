//
//  UIViewBorder.swift
//  sorulur
//
//  Created by Sinan Özman on 19.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /// view rounder selected multiple corners
    ///
    /// - Parameter view: UIView
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = UIView()
    ///    view.rounded()
    ///    ````
    func roundedView(_ color: UIColor) {
        log.debug("view rounded")
        self.round(corners: [.topRight, .bottomLeft, .bottomRight], radius: 20, borderColor: color, borderWidth: 2)
    }
}
