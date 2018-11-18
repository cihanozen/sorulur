//
//  DefaultPopupManager.swift
//  sorulur
//
//  Created by Sinan Özman on 10.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
/// Global Default Popup Manager
class DefaultPopupManager: NSObject {
    /// Shared instance
    static let shared = DefaultPopupManager()
    
    /// Default Popup Array
    var popups = [DefaultPopup]()
    
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
     DefaultPopupManager.shared.dismissAll(true, callCloseCallback: { callback in
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
     DefaultPopupManager.shared.hideAll()
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
     DefaultPopupManager.shared.showLastOne()
     ```` */
    func showLastOne() {
        popups.last?.isHidden = false
    }
    
    /// Remove popups. only last popup in popups array show
    ///
    /// - Parameters:
    ///   - view: DefaultPopup for remove
    ///   - callback: Remove success and last popup show finished callback
    /**
     ### Usage Example: ###
     ````
     DefaultPopupManager.shared.callAndShowLast(DefaultPopup, callback: { callback in
     ...
     }
     ```` */
    func callAndShowLast(_ view: DefaultPopup, callback: DefaultPopupCallBack? = nil) {
        if let index = self.popups.index(of: view) {
            popups.remove(at: index)
        }
        callback?(view)
    }
    
    /// Create Popup View and return popupView
    ///
    /// - Returns: DefaultPopup
    /**
     ### Usage Example: ###
     ````
     return DefaultPopupManager.shared.createPopupView(type: 0)
     ```` */
    func createPopupView() -> DefaultPopup {
        var viewPopup = DefaultPopup()
        viewPopup = DefaultPopup.fromNib()
        return viewPopup
    }
    
    /// if RootviewController have popup hideAll and create popupView. Soo if created check RootView type and popupShow
    ///
    /// - Parameters:
    ///   - inVC: RootView
    ///   - animated: show with animation true or false
    ///   - onConfirm: Showpopup finished callback
    /**
     ### Usage Example: ###
     ````
     DefaultPopupManager.shared.showPopup(self,animated: true, onConfirm: { callback in
     if callback {
            ...
        }
     })
     ```` */
    func showPopup(_ inVc: UIViewController, animated: Bool = true, onConfirm _: DefaultPopupCallBack? = nil) {
        hideAll()
        let viewPopup = createPopupView()
        print(viewPopup)
        var superView: UIView = inVc.view
        print(superView)
        if let vc = inVc.presentedViewController {
            superView = vc.view
        } else if let vc = inVc.tabBarController {
            superView = vc.view
        } else if let vc = inVc.navigationController {
            superView = vc.view
        }
        
        viewPopup.show(superView, animated: animated, popup: viewPopup)
        popups.append(viewPopup)
    }
}
