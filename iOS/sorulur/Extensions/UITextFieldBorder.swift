//
//  UITextFieldBorder.swift
//  sorulur
//
//  Created by Sinan Özman on 19.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    /// Textfield clear background and borderStyle set none
    ///
    /// - Parameter textfield: UITextField
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = UIView()
    ///    view.textFieldBorderRemove()
    ///    ````
    func textFieldBorderRemove() {
        log.debug("textfield background clear and border style set none")
        self.backgroundColor = UIColor.clear
        self.borderStyle = .none
    }
}
