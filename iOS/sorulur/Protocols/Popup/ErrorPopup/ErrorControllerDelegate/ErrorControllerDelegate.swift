//
//  ErrorControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// ErrorView Delegegate Protocol
protocol ErrorControllerDelegate {
    func remove(_ callClose: Bool)
    func removePopup(_ callClose: Bool)
    func dismiss(_ animated: Bool, callCloseCallback: Bool, popup: [ErrorPopup])
    func dismissPopup(_ animated: Bool, callCloseCallback: Bool, popup: [ErrorPopup])
    func add()
    func show(_ inView: UIView, animated: Bool, popup: ErrorPopup)
    func showPopup(_ inView: UIView, animated: Bool, popup: ErrorPopup)
}

// MARK: - ErrorPOPUP

extension ErrorControllerDelegate where Self: ErrorPopup {
    /// ErrorView Class Object
    var errorContoller: ErrorController {
        log.debug("LoginView")
        return ErrorController(param)
    }

    /// Remove Popup
    ///
    /// - Parameter _: remove
    func removePopup(_: Bool = true) {
//        errorContoller.remove(callClose)
    }

    /// Dismiss popup function
    ///
    /// - Parameters:
    ///   - animated: dismiss popup with aninmation
    ///   - callCloseCallback: dismiss popup finished callback
    ///   - popup: popup
    func dismissPopup(_ animated: Bool = true, callCloseCallback: Bool = true, popup: [ErrorPopup]) {
        errorContoller.dissmiss(animated, callCloseCallback: callCloseCallback, popup: popup)
    }

    /// Show Popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - animated: show popup with animation
    ///   - popup: popup
    func showPopup(_ inView: UIView, animated: Bool = true, popup: ErrorPopup) {
        log.debug(inView)
        log.debug(animated)
        errorContoller.show(inView, animated: animated, popup: popup)
    }
}
