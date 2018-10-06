//
//  LoginControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

/// Login Controller Delegate Protocol
protocol LoginControllerDelegate {
    
    /// Login Action
    func loginAction()
}

// MARK: - LoginVC
extension LoginControllerDelegate where Self: LoginVC {
    
    /// Login Controller Class Object
    var loginController: LoginController {
        log.debug("Login Controller")
        return LoginController(self.param)
    }
    
    /// Login Button Action
    func loginAction(){
        log.debug("Triggered login controller in login post")
        loginController.loginPost()
    }
}
