//
//  LeftMenuVCStructs.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// LeftMenu VC Variable Structs
struct LeftMenuVCStructs {
    weak var leftMenuCons: NSLayoutConstraint?
    weak var leftMenuView: UIView?
    weak var imageView: UIView?
    weak var profileImageView: UIImageView?
}

// MARK: - LeftMenuVCStructs initilasion and reset variables

extension LeftMenuVCStructs {
    /// LoginVCStruct İnit
    ///
    /// - Parameter view: LoginVC
    ///    ### Usage Example: ###
    ///    ````
    ///    LoginStruct(LoginVC.self)
    ///    ````
    init?(with view: LeftMenuVC) {
        log.debug("Login VC Struct init")
        self.leftMenuCons = view.leftMenuCons
        self.leftMenuView = view.leftMenuView
        self.imageView = view.imageView
        self.profileImageView = view.profileImageView
    }
    
    /// Reset Variables
    ///    ### Usage Example: ###
    ///    ````
    ///    let param = LoginVCStruct
    ///    param.reset()
    ///    ````
    mutating func reset() {
        self.leftMenuCons = nil
        self.leftMenuView = nil
        self.imageView = nil
        self.profileImageView = nil
    }
}
