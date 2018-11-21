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
    func config(color: UIColor, style: UIBarStyle, trans: Bool)
    func addLogo()
    func addTitle()
    func setup()
    func addButton(type: navButtonType , title: String, color: UIColor , image: UIImage?)
}

extension BaseNCDelegate where Self: UIViewController {
    func config(color: UIColor = .white, style: UIBarStyle = .default, trans: Bool = false) {
        self.navigationController?.navigationBar.backgroundColor = color
        self.navigationController?.navigationBar.barStyle = style
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
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
    
    func addButton(type: navButtonType , title: String, color: UIColor , image: UIImage? = nil) {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        if let img: UIImage = image {
            button.setImage(img, for: .normal)
            button.sizeToFit()
        }
        switch type {
        case .left:
            button.addTarget(self, action: #selector(BaseVC.leftAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(BaseVC.rightAction), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        case .back:
            button.addTarget(self, action: #selector(BaseVC.backAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}

enum navButtonType {
    case left
    case right
    case back
}
