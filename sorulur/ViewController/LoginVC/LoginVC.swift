//
//  LoginVC.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit

/// Login View Controller's Class
class LoginVC: UIViewController {
    /// LoginVC Variable Copy in sturct with other class implement
    var param: LoginVCStruct {
        log.debug("Login VC Struct")
        return LoginVCStruct(with: self) ?? LoginVCStruct()
    }

    /// Email View Outlet
    @IBOutlet var emailView: UIView!
    /// Email Text Field Outlet
    @IBOutlet var emailTextField: UITextField!
    /// Password View Outlet
    @IBOutlet var passwordView: UIView!
    /// Password Text Field Outlet
    @IBOutlet var passwordTextField: UITextField!
    /// Login Button Outlet
    @IBOutlet var loginButton: UIButton!
}

// MARK: - LoginViewDelegate

extension LoginVC: LoginViewDelegate {
    /// LoginVC Loading view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        log.debug("ViewDidLoad")

        // MARK: - Setup UI

        setupUI()
    }
}

// MARK: - LoginControllerDelegate

extension LoginVC: LoginControllerDelegate {
    /// Login Button Actions
    ///
    /// - Parameter sender: UIButton
    ///
    ///     ### Usage Example: ###
    ///     ````
    ///     @IBAction func loginButtonAction(sender: UIButton) {
    ///     ...
    ///     }
    ///     ````
    @IBAction func loginButtonAction(sender _: UIButton) {
        log.debug("click Login Button")
        loginAction()
    }
}
