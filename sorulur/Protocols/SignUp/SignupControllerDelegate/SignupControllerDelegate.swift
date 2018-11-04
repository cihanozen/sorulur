//
//  SignupControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 14.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

/// SignupController Delegate
protocol SignupControllerDelegate {
    func maleAction()
    func femaleAction()
}

// MARK: - SignUpVC
extension SignupControllerDelegate where Self: SignUpVC {
//    var signupController: SignupConroller {
//        log.debug("Signup Controller")
//        return SignupController(param)
//    }
    
    /// SignupView Object
    private var signupView: SignupView {
        log.debug("Signup View")
        return SignupView(param)
    }
    
    /// Male Action
    func maleAction() {
        signupView.maleSelected()
    }
    
    /// Female Action
    func femaleAction() {
       signupView.femaleSelected()
    }
}
