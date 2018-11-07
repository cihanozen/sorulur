//
//  LeftMenuDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

protocol LeftMenuDelegate {
    func openLeftViewProtocol()
    func closeLeftViewProtocol()
    func panChangePositionProtocol(_ notification: Notification?)
    func setupUI()
}

extension LeftMenuDelegate where Self: LeftMenuVC {
    func openLeftViewProtocol() {
        //        log.info(message: "start ope left view protocol")
        //        log.info(message: "call show left menu observe")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showLeftMenu"), object: nil)
        isOpenLeftMenu = true
        view.layoutIfNeeded()
        //        log.info(message: "left menu view functions")
        LeftMenuView(view, leftMenuCons).animationLeftView(duration: 0.5, delay: 0.0, cons: 0)
    }
    
    func closeLeftViewProtocol() {
        isOpenLeftMenu = false
        LeftMenuView(view, leftMenuCons).animationLeftView(duration: 0.5, delay: 0.0, cons: -212, status: true)
    }
    
    func panChangePositionProtocol(_ notification: Notification?) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showLeftMenu"), object: nil)
        var dictionary = notification?.userInfo
        let sender: CGFloat = (dictionary!["UIPanGestureRecognizer"] as? CGFloat)!
        let state = dictionary!["UIPanGestureRecognizerState"] as? Int
        if !isOpenLeftMenu {
            if LeftMenuView(view, leftMenuCons).leftMenuAnimation(cons: sender, state: state!, isOpenLeftMenu: false) {
                isOpenLeftMenu = true
            } else {
                isOpenLeftMenu = false
            }
        }
    }
    
    func setupUI() {
        let menuView = LeftMenuView(view: leftMenuView)
        menuView.viewEditCornerRadius(8, false)
        menuView.viewEditShadows(UIColor.black, 12, 0, 10, 0.15)
    }
}
