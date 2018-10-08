//
//  LoginVCStruct.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Login VC Variable Structs
struct LoginVCStruct {
    weak var view: UIView?
    weak var emailView: UIView?
    weak var emailTextField: UITextField?
    weak var passwordView: UIView?
    weak var passwordTextField: UITextField?
}

// MARK: - LoginVCSturct initilasion and reset variables

extension LoginVCStruct {
    /// LoginVCStruct İnit
    ///
    /// - Parameter view: LoginVC
    ///    ### Usage Example: ###
    ///    ````
    ///    LoginStruct(LoginVC.self)
    ///    ````
    init?(with view: LoginVC) {
        log.debug("Login VC Struct init")
        self.view = view.view
        emailView = view.emailView
        emailTextField = view.emailTextField
        passwordView = view.passwordView
        passwordTextField = view.passwordTextField
    }

    /// Reset Variables
    ///    ### Usage Example: ###
    ///    ````
    ///    let param = LoginVCStruct
    ///    param.reset()
    ///    ````
    mutating func reset() {
        log.debug("Login VC Struct reset")
        emailView = nil
        emailTextField = nil
        passwordView = nil
        passwordTextField = nil
        view = nil
    }
}
