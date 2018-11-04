//
//  LoginView.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Login View for LoginVC
class LoginView {
    /// LoginVC Variables for mapping
    var param: LoginVCStruct?

    /// LoginView inits
    ///
    /// - Parameter param: LoginVCStruct #(LoginVC Variable)#
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = LoginView(LoginVCStruct)
    ///    ````
    init(_ param: LoginVCStruct) {
        log.debug("Login View İnit")
        self.param = param
    }

    deinit {
        log.debug("login view deinit")
        self.param = nil
    }

    /// Background graniedns
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = LoginView(LoginVCStruct)
    ///    view.granient()
    ///    ````
    func granient() {
        log.debug("background color apply granient")
        param?.view?.applyGranient(colours: [COLORS.GRADIENTSTART_LOGIN, COLORS.GRADIENTEND_LOGIN])
    }

    /// Textfield clear background and borderStyle set none
    ///
    /// - Parameter textfield: UITextField
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = LoginView(LoginVCStruct)
    ///    view.textFieldBorderRemove(UITextField)
    ///    ````
    func textFieldBorderRemove(_ textfield: UITextField) {
        log.debug("textfield background clear and border style set none")
        textfield.backgroundColor = UIColor.clear
        textfield.borderStyle = .none
    }

    /// view rounder selected multiple corners
    ///
    /// - Parameter view: UIView
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = LoginView(LoginVCStruct)
    ///    view.rounded(UIView())
    ///    view.rounded(UIButton())
    ///    ````
    func rounded(_ view: Any?) {
        if let uiButton: UIButton = view as? UIButton {
           uiButton.roundedButton(COLORS.BORDER_WHITE)
        } else if let uiView: UIView = view as? UIView {
            log.debug("view rounded")
            uiView.roundedView(COLORS.BORDER_WHITE)
        }
    }
    
    /// First Login Animation
    /**
    ### Usage Example: ###
       ````
       let view = LoginView(LoginVCStruct)
        view.startupAnimation()
        ````
 */
    func startupAnimation(){
        setCenterLayout()
    }
    
   /// First Login loading set center logo position for animation if finished call setDefaultLayout function
    /**
    ### Usage Example: ###
    ````
    let view = LoginView(LoginVCStruct)
    view.startupAnimation()
    ````
 */
   private func setCenterLayout(){
        UIView.animate(withDuration: 0.0, animations: {
            self.param?.emailView?.alpha = 0
            self.param?.emailTextField?.alpha = 0
            self.param?.passwordView?.alpha = 0
            self.param?.passwordTextField?.alpha = 0
            self.param?.loginButton?.alpha = 0
            self.param?.directionLabel?.alpha = 0
            self.param?.emailLabel?.alpha = 0
            self.param?.passwordLabel?.alpha = 0
            self.param?.bottomView?.alpha = 0
            self.param?.logoViewRightCons?.constant = 112
            self.param?.logoViewLeftCons?.constant = 112
            self.param?.logoViewTopCons?.constant = 252
            self.param?.view?.layoutIfNeeded()
        },completion: {(_ finished) in
            self.setDefaultLayout()
        })
    }
    
    /// if finished center animation start back position
    /**
     ### Usage Example: ###
     ````
     let view = LoginView(LoginVCStruct)
     view.startupAnimation()
     ````
     */
   private func setDefaultLayout(){
        UIView.animate(withDuration: 0.8, delay: 0.6, animations: {
            self.param?.logoViewTopCons?.constant = 50
            self.param?.logoViewLeftCons?.constant = 39
            self.param?.logoViewRightCons?.constant = 217
            self.param?.emailView?.alpha = 1
            self.param?.emailTextField?.alpha = 1
            self.param?.passwordView?.alpha = 1
            self.param?.passwordTextField?.alpha = 1
            self.param?.loginButton?.alpha = 1
            self.param?.directionLabel?.alpha = 1
            self.param?.emailLabel?.alpha = 1
            self.param?.passwordLabel?.alpha = 1
            self.param?.bottomView?.alpha = 1
            self.param?.view?.layoutIfNeeded()
        })
    }
}
