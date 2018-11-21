//
//  BaseNCDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 21.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

protocol BaseNCDelegate {
    func addLogo()
    func addBack()
    func addTitle()
    func setup()
}

extension BaseNCDelegate where Self: UIViewController {
    func addLogo(){
        let image = UIImageView()
        image.image = UIImage(named: "group")
        image.sizeToFit()
        print("image frame : \(image.frame)")
        self.navigationItem.titleView = image
    }
    
    func addTitle(){
        self.navigationItem.title = "Merhaba"
    }
    
    func addBack() {
        let backbutton = UIButton(type: .custom)
        //        backbutton.setImage(UIImage(named: "BackButton.png"), forState: .normal) // Image can be downloaded from here below link
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
        backbutton.addTarget(self, action: #selector(BaseVC.backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
}
