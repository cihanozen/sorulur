//
//  SignUpVCStructs.swift
//  sorulur
//
//  Created by Sinan Özman on 14.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import DLRadioButton

/// Signup VC Variable Structs
struct SignUpVCStrcuts {
    /// SignupVC view
    weak var view: UIView?
    /// SignupVC Back Button Outlet
    weak var backButtonOutlet: UIButton?
    /// SignupVC Title Label
    weak var titleLabel: UILabel?
    /// SignupVC Description Label
    weak var descriptionLabel: UILabel?
    /// SignupVC Gender View
    weak var genderView: UIView?
    /// SignupVC Male View
    weak var maleView: UIView?
    /// SignupVC Male Image View
    weak var maleImageView: UIImageView?
    /// SignupVC Female View
    weak var femaleView: UIView?
    /// SignupVC Male Radio Button
    weak var maleRadioButton: DLRadioButton?
    /// SignupVC Female Radio Button
    weak var femaleRadioButton: DLRadioButton?
    /// SignupVC Female Image View
    weak var femaleImageView: UIImageView?
    /// SignupVC User Nick Name Label
    weak var userNickNameLabel: UILabel?
    /// SignupVC User Nick Name View
    weak var userNickNameView: UIView?
    /// SignupVC User Nick Name TextField
    weak var userNickNameTextField: UITextField?
    /// SignupVC Email Label
    weak var emailLabel: UILabel?
    /// SignupVC Email View
    weak var emailView: UIView?
    /// SignupVC Email TextField
    weak var emailTextField: UITextField?
    /// SignupVC Password Label
    weak var passwordLabel: UILabel?
    /// SignupVC Password View
    weak var passwordView: UIView?
    /// SignupVC Password TextField
    weak var passwordTextField: UITextField?
    /// SignupVC Signup Button
    weak var signupButton: UIButton?
    
    /// SignupVC Back Button Left Constraint
    weak var backButtonLeftCons: NSLayoutConstraint?
    /// SignupVC Title Label Top Constraint
    weak var titleLabelTopCons: NSLayoutConstraint?
    /// SignupVC Male Left Constraint
    weak var maleLeftConstant: NSLayoutConstraint?
    /// SignupVC Female Right Constraint
    weak var femaleRightCons: NSLayoutConstraint?
    /// SignupVC User Nickname Left Constraint
    weak var userNickNameLabelLeftCons: NSLayoutConstraint?
    /// SignupVC User Nickname View Left Constraint
    weak var userNickNameViewLeftCons: NSLayoutConstraint?
    /// SignupVC Email Label Left Constraint
    weak var emailLabelLeftCons: NSLayoutConstraint?
    /// SignupVC Email View Left Constraint
    weak var emailViewLeftCons: NSLayoutConstraint?
    /// SignupVC Password Label Left Constraint
    weak var passwordLabelLeftCons: NSLayoutConstraint?
    /// SignupVC Password View Left Constraint
    weak var passwordViewLeftCons: NSLayoutConstraint?
    /// SignupVC Signup Button Bottom Constraint
    weak var signupButtonBottomCons: NSLayoutConstraint?
}

// MARK: - SignupVCSturct initilasion and reset variables

extension SignUpVCStrcuts {
    /// SignupVCStruct İnit
    ///
    /// - Parameter view: SignupVC
    ///    ### Usage Example: ###
    ///    ````
    ///    SignUpStruct(SignUpVC.self)
    ///    ````
    init?(with view: SignUpVC) {
        self.view = view.view
        backButtonOutlet = view.backButtonOutlet
        titleLabel = view.titleLabel
        descriptionLabel = view.descriptionLabel
        genderView = view.genderView
        maleView = view.maleView
        maleImageView = view.maleImageView
        femaleView = view.femaleView
        femaleImageView = view.femaleImageView
        maleRadioButton = view.maleRadioButton
        femaleRadioButton = view.femaleRadioButton
        userNickNameLabel = view.userNickNameLabel
        userNickNameView = view.userNickNameView
        userNickNameTextField =  view.userNickNameTextField
        emailLabel = view.emailLabel
        emailView = view.emailView
        emailTextField = view.emailTextField
        passwordLabel = view.passwordLabel
        passwordView = view.passwordView
        passwordTextField = view.passwordTextField
        signupButton = view.signupButton
        
        backButtonLeftCons = view.backButtonLeftCons
        titleLabelTopCons = view.titleLabelTopCons
        maleLeftConstant = view.maleLeftConstant
        femaleRightCons = view.femaleRightCons
        userNickNameLabelLeftCons = view.userNickNameLabelLeftCons
        userNickNameViewLeftCons = view.userNickNameViewLeftCons
        emailLabelLeftCons = view.emailLabelLeftCons
        emailViewLeftCons = view.emailViewLeftCons
        passwordLabelLeftCons = view.passwordLabelLeftCons
        passwordViewLeftCons = view.passwordViewLeftCons
        signupButtonBottomCons = view.signupButtonBottomCons
    }
    
    /// Reset Variables
    ///    ### Usage Example: ###
    ///    ````
    ///    let param = LoginVCStruct
    ///    param.reset()
    ///    ````
    mutating func reset() {
        backButtonOutlet = nil
        titleLabel = nil
        descriptionLabel = nil
        genderView = nil
        maleView = nil
        maleImageView = nil
        femaleView = nil
        femaleImageView = nil
        maleRadioButton = nil
        femaleRadioButton = nil
        userNickNameLabel = nil
        userNickNameView = nil
        userNickNameTextField = nil
        emailLabel = nil
        emailView = nil
        emailTextField = nil
        passwordLabel = nil
        passwordView = nil
        passwordTextField = nil
        signupButton = nil
        backButtonLeftCons = nil
        titleLabelTopCons = nil
        maleLeftConstant = nil
        femaleRightCons = nil
        userNickNameLabelLeftCons = nil
        userNickNameViewLeftCons = nil
        emailLabelLeftCons = nil
        emailViewLeftCons = nil
        passwordLabelLeftCons = nil
        passwordViewLeftCons = nil
        signupButtonBottomCons = nil
    }
}

