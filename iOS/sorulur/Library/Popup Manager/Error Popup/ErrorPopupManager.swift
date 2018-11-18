//
//  PopupManager.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Global Error Popup Manager
class ErrorPopupManager: NSObject {
    /// Shared instance
    static let shared = ErrorPopupManager()

    /// Error Popup Array
    var popups = [ErrorPopup]()

    /// Override init
    fileprivate override init() {
        super.init()
    }

    /// Dismiss all popups in popups Array
    ///
    /// - Parameters:
    ///   - animated: dismiss popup with animation
    ///   - callCloseCallbacks: popup is closed callback
    /**
     ### Usage Example: ###
     ````
     ErrorPopupManager.shared.dismissAll(true, callCloseCallback: { callback in
     if callback {
            ...
        }
     })
     ````
     */
    func dismissAll(_ animated: Bool = false, callCloseCallbacks: Bool = true) {
        for item in popups {
            item.dismiss(animated, callCloseCallback: callCloseCallbacks, popup: popups)
        }
        popups.removeAll()
    }

    /// Popups only hide in rootView
    /**
     ### Usage Example: ###
     ````
     ErrorPopupManager.shared.hideAll()
     ````
     */
    func hideAll() {
        for item in popups {
            print(item)
            item.isHidden = true
        }
    }

    /// last popup in popups array showing
    /**
     ### Usage Example: ###
     ````
     ErrorPopupManager.shared.showLastOne()
     ```` */
    func showLastOne() {
        popups.last?.isHidden = false
    }

    /// Remove popups. only last popup in popups array show
    ///
    /// - Parameters:
    ///   - view: ErrorPopup for remove
    ///   - callback: Remove success and last popup show finished callback
    /**
     ### Usage Example: ###
     ````
     ErrorPopupManager.shared.callAndShowLast(ErrorPopup, callback: { callback in
     ...
     }
     ```` */
    func callAndShowLast(_ view: ErrorPopup, callback: ErrorPopupCallBack? = nil) {
        if let index = self.popups.index(of: view) {
            popups.remove(at: index)
        }
        callback?(view)
    }

    /// Create Popup View and return popupView
    ///
    /// - Parameter type: Error Type(type: 0 = Email is valid, type: 1 = Password is valid)
    /// - Returns: ErrorPopup
    /**
     ### Usage Example: ###
     ````
     return ErrorPopupManager.shared.createPopupView(type: 0)
     ```` */
    func createPopupView(type: Int) -> ErrorPopup {
        var viewPopup = ErrorPopup()
        switch type {
        case 0:
            viewPopup = ErrorPopup.fromNib()
        case 1:
            viewPopup = ErrorPopup.fromNib()
            viewPopup.setContent(text: "Şifre Hatalı")
        default:
            viewPopup = ErrorPopup.fromNib()
        }
        return viewPopup
    }

    /// if RootviewController have popup hideAll and create popupView. Soo if created check RootView type and popupShow
    ///
    /// - Parameters:
    ///   - inVC: RootView
    ///   - animated: show with animation true or false
    ///   - onConfirm: Showpopup finished callback
    ///   - type: Error Type(type: 0 = Email is valid, type: 1 = Password is valid)
    /**
     ### Usage Example: ###
     ````
     ErrorPopupManager.shared.showPopup(self,animated: true, onConfirm: { callback in
     if callback {
     ...
     }
     }, type: 1)
     ```` */
    func showPopup(_ inVC: UIViewController, animated: Bool = true, onConfirm _: ErrorPopupCallBack? = nil, type: Int) {
        hideAll()
        let viewPopup = createPopupView(type: type)
        print(viewPopup)
        var superView: UIView = inVC.view
        print(superView)
        if let vc = inVC.presentedViewController {
            superView = vc.view
        } else if let vc = inVC.tabBarController {
            superView = vc.view
        } else if let vc = inVC.navigationController {
            superView = vc.view
        }
        viewPopup.show(superView, animated: animated, popup: viewPopup)
        popups.append(viewPopup)
    }
}
