//
//  BaseNCDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 21.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol BaseNCDelegate {
    func config(color: UIColor, style: UIBarStyle, trans: Bool)
    func addLogo()
    func addTitle(text: String, color: UIColor)
    func setup()
    func addButton(type: navButtonType , title: String, color: UIColor , image: UIImage?)
}

extension BaseNCDelegate where Self: UIViewController {
    func config(color: UIColor = .black, style: UIBarStyle = .default, trans: Bool = false) {
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.barStyle = style
        self.navigationController?.navigationBar.isTranslucent = trans
    }
    
    func addLogo(){
        let image = UIImageView()
        image.image = UIImage(named: "group")
        image.sizeToFit()
        print("image frame : \(image.frame)")
        self.navigationItem.titleView = image
    }
    
    func addTitle(text: String, color: UIColor = .white){
        let label = UILabel()
        label.text = text
        label.textColor = color
        self.navigationItem.titleView = label
    }
    
    func addButton(type: navButtonType , title: String = "", color: UIColor , image: UIImage? = nil) {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        if let img: UIImage = image {
            button.setImage(img, for: .normal)
        }
        switch type {
        case .left:
            button.addTarget(self, action: #selector(BaseVC.leftAction), for: .touchUpInside)
            var view = UIBarButtonItem(customView: button)
            if let _: UIImage = image {
              view = barButtonSetSize(view: view)
            }
            self.navigationItem.leftBarButtonItem = view
        case .right:
            button.addTarget(self, action: #selector(BaseVC.rightAction), for: .touchUpInside)
            var view = UIBarButtonItem(customView: button)
            if let _: UIImage = image {
                view = barButtonSetSize(view: view)
            }
            self.navigationItem.rightBarButtonItem = view
        case .back:
            button.addTarget(self, action: #selector(BaseVC.backAction), for: .touchUpInside)
            var view = UIBarButtonItem(customView: button)
            if let _: UIImage = image {
                view = barButtonSetSize(view: view)
            }
            self.navigationItem.leftBarButtonItem = view
        }
    }
    
    private func barButtonSetSize(view: UIBarButtonItem) -> UIBarButtonItem {
        view.customView?.snp.makeConstraints ({ (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
        })
        return view
    }
}

enum navButtonType {
    case left
    case right
    case back
}
