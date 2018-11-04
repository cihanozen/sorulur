//
//  SignupView.swift
//  sorulur
//
//  Created by Sinan Özman on 14.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Signup View for SignUpVC
class SignupView {
    /// SignUPVC Variables for mapping
    var param: SignUpVCStrcuts?
    
    /// SignUpView inits
    ///
    /// - Parameter param: SignUpVCStruct #(SignUpVC Variable)#
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = SignUpView(SignUpVCStruct)
    ///    ````
    init(_ param: SignUpVCStrcuts) {
        log.debug("SignUp View İnit")
        self.param = param
    }
    
    deinit {
        log.debug("SignUp view deinit")
        self.param = nil
    }
    
    /// Background graniedns
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = SignUpView(SignUpVCStruct)
    ///    view.granient()
    ///    ````
    func granient() {
        log.debug("background color apply granient")
        param?.view?.applyGranient(colours: [COLORS.GRADIENTSTART_SIGNUP, COLORS.GRADIENTEND_SIGNUP])
    }
    
    /// Textfield clear background and borderStyle set none
    ///
    /// - Parameter textfield: UITextField
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = SignUpView(SignUpVCStruct)
    ///    view.textFieldBorderRemove(UITextField)
    ///    ````
    func textFieldBorderRemove(_ textfield: UITextField) {
        textfield.textFieldBorderRemove()
    }
    
    /// view rounder selected multiple corners
    ///
    /// - Parameter view: UIView
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = SignUpView(SignUpVCStruct)
    ///    view.rounded(UIView())
    ///    view.rounded(UIButton())
    ///    ````
    func rounded(_ view: Any?) {
        if let uiButton: UIButton = view as? UIButton {
            uiButton.roundedButton(COLORS.BORDER_PURPLE)
        } else if let uiView: UIView = view as? UIView {
            log.debug("view rounded")
            uiView.roundedView(COLORS.BORDER_BLACK)
        }
    }
    
    /// First SignUp Animation
    /**
     ### Usage Example: ###
     ````
     let view = SignUpView(SignUpVCStruct)
     view.startupAnimation()
     ````
     */
    func startupAnimation(){
        setHiddenLayout()
    }
    
    /// SignupViewController Gender Button Clear Background Color
    /**
     ### Usage Example: ###
     ````
     let view = SignUpView(SignUpVCStruct)
     view.radioButtonClearBg()
     ````
     */
    func radioButtonClearBg(){
        param?.maleRadioButton?.backgroundColor = UIColor.clear
        param?.femaleRadioButton?.backgroundColor = UIColor.clear
    }
    
    private func setHiddenLayout() {
        UIView.animate(withDuration: 0.0, delay: 0.0, animations: {
            self.param?.backButtonLeftCons?.constant = -160
            self.param?.titleLabelTopCons?.constant = -300
            self.param?.maleLeftConstant?.constant = -400
            self.param?.femaleRightCons?.constant = -400
            self.param?.userNickNameLabelLeftCons?.constant = -400
            self.param?.userNickNameViewLeftCons?.constant = -450
            self.param?.emailLabelLeftCons?.constant = -400
            self.param?.emailViewLeftCons?.constant = -450
            self.param?.passwordLabelLeftCons?.constant = -400
            self.param?.passwordViewLeftCons?.constant = -450
            self.param?.signupButtonBottomCons?.constant = -400
            self.param?.view?.layoutIfNeeded()
        },completion: {(_ finished: Bool) in
            self.setDefaultLayout()
        })
    }
    
    private func setDefaultLayout(){
        UIView.animate(withDuration: 0.8, delay: 0.6, animations: {
            self.param?.backButtonLeftCons?.constant = 8
            self.param?.titleLabelTopCons?.constant = 8
            self.param?.maleLeftConstant?.constant = 8
            self.param?.femaleRightCons?.constant = 8
            self.param?.userNickNameLabelLeftCons?.constant = 18
            self.param?.userNickNameViewLeftCons?.constant = 18
            self.param?.emailLabelLeftCons?.constant = 18
            self.param?.emailViewLeftCons?.constant = 18
            self.param?.passwordLabelLeftCons?.constant = 18
            self.param?.passwordViewLeftCons?.constant = 18
            self.param?.signupButtonBottomCons?.constant = 18
            self.param?.view?.layoutIfNeeded()
        })
    }
    
    public func maleSelected(){
        param?.maleRadioButton?.isSelected = true
        if param?.femaleRadioButton?.isSelected ?? true {
            param?.femaleRadioButton?.isSelected = false
        }
    }
    
    public func femaleSelected(){
        param?.femaleRadioButton?.isSelected = true
        if param?.maleRadioButton?.isSelected ?? true {
            param?.maleRadioButton?.isSelected = false
        }
    }
}
