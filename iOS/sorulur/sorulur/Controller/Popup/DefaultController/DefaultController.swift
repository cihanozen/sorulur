//
//  DefaultController.swift
//  sorulur
//
//  Created by Sinan Özman on 10.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Default Controller for ErrorPopup
class DefaultController {
    /// DefaultPopup variables
    var param: DefaultViewStruct?
    
    /// Error Controller İnits
    ///
    /// - Parameter param: ErrorViewStruct
    /// ### Usage Example: ###
    /// ````
    /// let controller = ErrorController(ErrorViewStruct)
    /// ````
    init(_ param: DefaultViewStruct){
        print("Struct init")
        self.param = param
    }
    
    /// Default init
    init(){}
    
    deinit {
        print("Deinit")
        self.param = nil
    }
    
    
    /// Remove popup
    ///
    /// - Parameters:
    ///   - callClose: finished Callback
    ///   - popup: popup
    func remove(_ callClose: Bool = true, popup: [DefaultPopup]) {
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
    func add(_ inView: UIView, popup: DefaultPopup) {
        let view = DefaultPopupView()
        view.popupAdd(inView, popup: popup)
    }
    
    /// Showing popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - animated: show with animation
    ///   - popup: popup
    func show(_ inView: UIView, animated: Bool = true, popup: DefaultPopup) {
        print(inView)
        print(animated)
        let view = DefaultPopupView()
        print(view)
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
    func dismiss(_ animated: Bool = true, callCloseCallback: Bool = true, popup: [DefaultPopup]) {
        let view = DefaultPopupView()
        if animated {
            view.popupDismiss(callCloseCallback, popup: popup)
        } else {
            remove(callCloseCallback, popup: popup)
        }
    }
}
