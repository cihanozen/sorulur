//
//  LeftMenuVC.swift
//  sorulur
//
//  Created by Sinan Özman on 5.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuVC: UIViewController, LeftMenuDelegate {
    var isOpenLeftMenu: Bool = false
    @IBOutlet var leftMenuCons: NSLayoutConstraint!
    @IBOutlet var leftMenuView: UIView!
    @IBOutlet var imageView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    
    let open: Selector = #selector(openLeftView)
    let close: Selector = #selector(closeLeftView)
    let pan: Selector = #selector(panChangePosition)
    let openName = NSNotification.Name(rawValue: "openLeftView")
    let closeName = NSNotification.Name(rawValue: "closeLeftView")
    let panName = NSNotification.Name(rawValue: "panChangePosition")
    
    var param: LeftMenuVCStructs {
        log.debug("Login VC Struct")
        return LeftMenuVCStructs(with: self) ?? LeftMenuVCStructs()
    }
}

extension LeftMenuVC: LeftMenuViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: open, name: openName, object: nil)
        NotificationCenter.default.addObserver(self, selector: close, name: closeName, object: nil)
        NotificationCenter.default.addObserver(self, selector: pan, name: panName, object: nil)
        setupUI()
        roundedProfileImage()
        dataSetup()
    }
}

extension LeftMenuVC: LeftMenuControllerDelegate {
    @IBAction func closeLeftMenu(){
        closeLeftView()
    }
    
    @objc func openLeftView(){
        openLeftViewProtocol()
    }
    
    @objc func closeLeftView(){
        closeLeftViewProtocol()
    }
    
    @objc func panChangePosition(_ notification: Notification?){
        panChangePositionProtocol(notification)
    }
    
    func dataSetup(){
        setProfileImage()
    }
}
