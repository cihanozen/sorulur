//
//  ErrorController.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Error Controller for ErrorPopup
class ErrorController {
    /// ErrorPopup variables
    var param: ErrorViewStruct?

    /// Error Controller İnits
    ///
    /// - Parameter param: ErrorViewStruct
    /// ### Usage Example: ###
    /// ````
    /// let controller = ErrorController(ErrorViewStruct)
    /// ````
    init(_ param: ErrorViewStruct) {
        log.debug("Login Controller İnit")
        self.param = param
    }

    /// Default init
    init() {}

    deinit {
        log.debug("Login Controller deinit")
        self.param = nil
    }

    /// Remove popup
    ///
    /// - Parameters:
    ///   - callClose: finished Callback
    ///   - popup: popup
    func remove(_ callClose: Bool = true, popup: [ErrorPopup]) {
        for item in popup {
            item.removeFromSuperview()
            if callClose {
                param?.onClose!(item)
            }
        }
    }

    /// Add Popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - popup: popup
    func add(_ inView: UIView, popup: ErrorPopup) {
        let view = ErrorPopupView()
        view.popupAdd(inView, popup: popup)
    }

    /// Showing popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - animated: show with animation
    ///   - popup: popup
    func show(_ inView: UIView, animated: Bool = true, popup: ErrorPopup) {
        log.debug(inView)
        log.debug(animated)
        let view = ErrorPopupView()
        log.debug(view)
        if animated {
            view.popupShowAnimated(inView, popup: popup)
        } else {
            view.popupAdd(inView, popup: popup)
        }
    }

    /// Dismiss Popup
    ///
    /// - Parameters:
    ///   - animated: dismiss popup with animation
    ///   - callCloseCallback: popup dismiss finished callback
    ///   - popup: popup
    func dissmiss(_ animated: Bool = true, callCloseCallback: Bool = true, popup: [ErrorPopup]) {
        let view = ErrorPopupView()
        if animated {
            view.popupDismiss(callCloseCallback, popup: popup)
        } else {
            remove(callCloseCallback, popup: popup)
        }
    }
}
