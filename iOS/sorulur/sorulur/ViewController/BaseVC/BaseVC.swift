//
//  BaseVC.swift
//  sorulur
//
//  Created by Sinan Özman on 5.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, BaseVCDelegate {
    func leftButtonAction() {
        
    }
    
    func rightButtonAction() {
        
    }
    
    func backButtonAction() {
        
    }
}

extension BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseVC {
    @objc func backAction(){
        backButtonAction()
    }
    
    @objc func leftAction(){
        leftButtonAction()
    }
    
    @objc func rightAction(){
        rightButtonAction()
    }
}
