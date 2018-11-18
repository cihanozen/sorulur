//
//  SignUpVC.swift
//  sorulur
//
//  Created by Sinan Özman on 14.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit
import DLRadioButton

/// SignupVC
class SignUpVC: UIViewController {
    
    /// Global Struct
    var param: SignUpVCStrcuts {
        print("Login VC Struct")
        return SignUpVCStrcuts(with: self) ?? SignUpVCStrcuts()
    }
    
    /// backButtonOutlet
    @IBOutlet weak var backButtonOutlet: UIButton!
    /// Title Label
    @IBOutlet weak var titleLabel: UILabel!
    /// Description Label
    @IBOutlet weak var descriptionLabel: UILabel!
    /// Gender View
    @IBOutlet weak var genderView: UIView!
    /// Male View
    @IBOutlet weak var maleView: UIView!
    /// Male Image View
    @IBOutlet weak var maleImageView: UIImageView!
    /// Female View
    @IBOutlet weak var femaleView: UIView!
    /// Female Image View
    @IBOutlet weak var femaleImageView: UIImageView!
    /// User Nick Name Label
    @IBOutlet weak var userNickNameLabel: UILabel!
    /// User Nick Name View
    @IBOutlet weak var userNickNameView: UIView!
    /// User Nick Name TextField
    @IBOutlet weak var userNickNameTextField: UITextField!
    /// Email Label
    @IBOutlet weak var emailLabel: UILabel!
    /// Email View
    @IBOutlet weak var emailView: UIView!
    /// Email TextField
    @IBOutlet weak var emailTextField: UITextField!
    /// Password Label
    @IBOutlet weak var passwordLabel: UILabel!
    /// Password View
    @IBOutlet weak var passwordView: UIView!
    /// Password TextField
    @IBOutlet weak var passwordTextField: UITextField!
    /// SignupButton
    @IBOutlet weak var signupButton: UIButton!
    /// Male Radio Button
    @IBOutlet weak var maleRadioButton: DLRadioButton!
    /// Female Radio Button
    @IBOutlet weak var femaleRadioButton: DLRadioButton!
    
    /// Back Button Left Constraint
    @IBOutlet weak var backButtonLeftCons: NSLayoutConstraint!
    /// Title Label Top Constraint
    @IBOutlet weak var titleLabelTopCons: NSLayoutConstraint!
    /// male Left Constraint
    @IBOutlet weak var maleLeftConstant: NSLayoutConstraint!
    /// Female right Constraint
    @IBOutlet weak var femaleRightCons: NSLayoutConstraint!
    /// female right Constraint
    @IBOutlet weak var userNickNameLabelLeftCons: NSLayoutConstraint!
    /// User Nick Name View Left Constraint
    @IBOutlet weak var userNickNameViewLeftCons: NSLayoutConstraint!
    /// Email Label Left Constraint
    @IBOutlet weak var emailLabelLeftCons: NSLayoutConstraint!
    /// Email View Left Constraint
    @IBOutlet weak var emailViewLeftCons: NSLayoutConstraint!
    /// Password Label Left Constraint
    @IBOutlet weak var passwordLabelLeftCons: NSLayoutConstraint!
    /// Password View Left Constraint
    @IBOutlet weak var passwordViewLeftCons: NSLayoutConstraint!
    /// Signup Button Bottom Constraint
    @IBOutlet weak var signupButtonBottomCons: NSLayoutConstraint!
}

// MARK: - SignupViewDelegate
extension SignUpVC: SignupViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
}

// MARK: - SignupControllerDelegate
extension SignUpVC: SignupControllerDelegate {

    /// Male Action Function
    ///
    /// - Parameter sender: TapGesture
    @IBAction func maleAction(_ sender: UITapGestureRecognizer) {
       maleAction()
    }
    
    /// Female Action Function
    ///
    /// - Parameter sender: TapGesture
    @IBAction func femaleAction(_ sender: UITapGestureRecognizer) {
      femaleAction()
    }
    
    /// Back Button Action
    ///
    /// - Parameter sender: UIButton
    @IBAction func backButtonAction(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
