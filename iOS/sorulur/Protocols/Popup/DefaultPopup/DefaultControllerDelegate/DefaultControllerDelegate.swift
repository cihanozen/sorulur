//
//  DefaultControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 10.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// DefaultView Delegegate Protocol
protocol DefaultControllerDelegate {
    func remove(_ callClose: Bool)
    func removePopup(_ callBack: Bool)
    func dismiss(_ animated: Bool, callCloseCallback: Bool, popup: [DefaultPopup])
    func dismissPopup(_ animated: Bool, callCloseCallback: Bool, popup: [DefaultPopup])
    func add()
    func show(_ inView: UIView, animated: Bool, popup: DefaultPopup)
    func showPopup(_ inView: UIView, animated: Bool, popup: DefaultPopup)
}

// MARK: - DefaultPOPUP

extension DefaultControllerDelegate where Self: DefaultPopup {
        /// DefaultView Class Object
    var defaultController: DefaultController {
        log.debug("")
        return DefaultController(param)
    }
    
    /// Remove Popup
    ///
    /// - Parameter _: remove
    func removePopup(_: Bool = true){
//        defaultController.remove(callClose)
    }
    
    /// Dismiss popup function
    ///
    /// - Parameters:
    ///   - animated: dismiss popup with aninmation
    ///   - callCloseCallback: dismiss popup finished callback
    ///   - popup: popup
    func dismissPopup(_ animated: Bool = true, callCloseCallback: Bool = true, popup: [DefaultPopup]) {
        defaultController.dismiss(animated, callCloseCallback: callCloseCallback, popup: popup)
    }
    
    /// Show Popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - animated: show popup with animation
    ///   - popup: popup
    func showPopup(_ inView: UIView, animated: Bool = true, popup: DefaultPopup) {
        log.debug(inView)
        log.debug(animated)
        defaultController.show(inView, animated: animated, popup: popup)
    }
}
