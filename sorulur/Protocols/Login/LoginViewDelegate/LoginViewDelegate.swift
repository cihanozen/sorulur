//
//  LoginDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


/// Login View Delegegate Protocol
protocol LoginViewDelegate {
    
    /// loading view setup ui variables
    func setupUI()
}

// MARK: - LoginVC
extension LoginViewDelegate where Self: LoginVC {
    
    /// loginView Class Object
    var loginView: LoginView {
        log.debug("LoginView")
        return LoginView(self.param)
    }
    /// SetupUI
    func setupUI() {
        log.debug("setupUI")
        loginView.granient()
        loginView.textFieldBorderRemove(emailTextField)
        loginView.textFieldBorderRemove(passwordTextField)
        loginView.rounded(emailView)
        loginView.rounded(passwordView)
    }
}
