//
//  SignupViewDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 14.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

/// Login View Delegegate Protocol
protocol SignupViewDelegate {
    /// loading view setup ui variables
    func setupUI()
}

// MARK: - LoginVC

extension SignupViewDelegate where Self: SignUpVC {
    /// loginView Class Object
    private var signupView: SignupView {
        log.debug("LoginView")
        return SignupView(param)
    }
    
    /// SetupUI
    func setupUI() {
        log.debug("setupUI")
        signupView.radioButtonClearBg()
        textFields()
        roundedViews()
        signupView.startupAnimation()
        self.view.layoutIfNeeded()
    }
    
    /// TextField Setup
    fileprivate func textFields(){
        let textFieldArray: [UITextField] = [userNickNameTextField, emailTextField, passwordTextField]
        for textField in textFieldArray {
            signupView.textFieldBorderRemove(textField)
        }
    }
    
    /// Rouded textfield View
    fileprivate func roundedViews(){
        let views: [UIView] = [userNickNameView, emailView, passwordView, signupButton]
        for view in views {
            signupView.rounded(view)
        }
    }
}

