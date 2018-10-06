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
    func granient(){
        log.debug("background color apply granient")
        param?.view?.applyGranient(colours: [COLORS.GRADIENTSTART, COLORS.GRADIENTEND])
    }
    
    /// Textfield clear background and borderStyle set none
    ///
    /// - Parameter textfield: UITextField
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = LoginView(LoginVCStruct)
    ///    view.textFieldBorderRemove(UITextField)
    ///    ````
    func textFieldBorderRemove(_ textfield: UITextField){
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
    ///    ````
    func rounded(_ view: UIView){
        log.debug("view rounded")
        view.round(corners: [.topRight, .bottomLeft, .bottomRight], radius: 20, borderColor: COLORS.BORDER_WHITE, borderWidth: 1)
    }
}
