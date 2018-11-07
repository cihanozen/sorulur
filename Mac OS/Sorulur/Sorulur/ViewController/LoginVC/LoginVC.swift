//
//  LoginVC.swift
//  Sorulur
//
//  Created by Sinan Özman on 4.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Cocoa

class LoginVC: NSViewController {
    var param: LoginVCStruct {
//        log.debug("Login VC Struct")
        return LoginVCStruct(with: self) ?? LoginVCStruct()
    }
}

extension LoginVC: LoginViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        setupUI()
    }
}
