//
//  LoginControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

/// Login Controller Delegate Protocol
protocol LoginControllerDelegate {
    /// Login Action
    func loginAction()
}

// MARK: - LoginVC

extension LoginControllerDelegate where Self: LoginVC {
    /// Login Controller Class Object
    var loginController: LoginController {
        print("Login Controller")
        return LoginController(param)
    }

    /// Login Button Action
    func loginAction() {
        print("Triggered login controller in login post")
        loginController.loginPost(self , completion: { finish in
            if finish {
                self.navigate(.Navigation)
            }
        })
    }
}
