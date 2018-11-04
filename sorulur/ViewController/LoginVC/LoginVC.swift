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
    /// Logo Bire Outler
    @IBOutlet weak var logoView: UIImageView!
    /// Direaction Label Outlet
    @IBOutlet weak var directionLabel: UILabel!
    /// Email Label Outlet
    @IBOutlet weak var emailLabel: UILabel!
    /// Password Label outlet
    @IBOutlet weak var passwordLabel: UILabel!
    /// Bottom View Outlet
    @IBOutlet weak var bottomView: UIView!
    /// Logo View Right Constraint
    @IBOutlet weak var logoViewRightCons: NSLayoutConstraint!
    /// Logo View Left Constraint
    @IBOutlet weak var logoViewLeftCons: NSLayoutConstraint!
    /// LOGO View Bottom Constraint
    @IBOutlet weak var logoViewBottomCons: NSLayoutConstraint!
    /// LOGO View Top Constraint
    @IBOutlet weak var logoViewTopCons: NSLayoutConstraint!
    
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

extension LoginVC: LoginControllerDelegate, router{
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
    
    /// SignupAction
    ///
    /// - Parameter _: UIButton
    @IBAction func signupAction(sender _: UIButton) {
        navigate(.Signup)
    }
}
