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
    weak var logoView: UIImageView?
    weak var directionLabel: UILabel?
    weak var emailLabel: UILabel?
    weak var passwordLabel: UILabel?
    weak var bottomView: UIView?
    weak var logoViewRightCons: NSLayoutConstraint?
    weak var logoViewLeftCons: NSLayoutConstraint?
    weak var logoViewBottomCons: NSLayoutConstraint?
    weak var logoViewTopCons: NSLayoutConstraint?
    weak var loginButton: UIButton?
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
        print("Login VC Struct init")
        self.view = view.view
        emailView = view.emailView
        emailTextField = view.emailTextField
        passwordView = view.passwordView
        passwordTextField = view.passwordTextField
        logoView = view.logoView
        directionLabel = view.directionLabel
        emailLabel = view.emailLabel
        passwordLabel = view.passwordLabel
        bottomView = view.bottomView
        logoViewRightCons = view.logoViewRightCons
        logoViewLeftCons = view.logoViewLeftCons
        logoViewTopCons = view.logoViewTopCons
        logoViewBottomCons = view.logoViewBottomCons
        loginButton = view.loginButton
    }

    /// Reset Variables
    ///    ### Usage Example: ###
    ///    ````
    ///    let param = LoginVCStruct
    ///    param.reset()
    ///    ````
    mutating func reset() {
        print("Login VC Struct reset")
        emailView = nil
        emailTextField = nil
        passwordView = nil
        passwordTextField = nil
        logoView = nil
        directionLabel = nil
        emailLabel = nil
        passwordLabel = nil
        bottomView = nil
        logoViewRightCons = nil
        logoViewLeftCons = nil
        logoViewTopCons = nil
        logoViewBottomCons = nil
        loginButton = nil
        view = nil
    }
}
