//
//  BaseNC.swift
//  Yenibiris
//
//  Created by Barış Özer on 10/20/16.
//  Copyright © 2016 Yenibiris. All rights reserved.
//

import UIKit

class BaseNC: UINavigationController, UIGestureRecognizerDelegate {
    
    var isPopGestureEnabled:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    //MARK: UIGestureRecognizer Delegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && isPopGestureEnabled
    }
}
