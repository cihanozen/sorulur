//
//  DefaultPopupView.swift
//  sorulur
//
//  Created by Sinan Özman on 9.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

/// DefaultPopupView for DefaultPopup
class DefaultPopupView {
    /// DefaultPopup Variables for mapping
    var param: DefaultViewStruct?
    
    /// DefaultPopupView inits
    ///
    /// - Parameter param: DefaultViewStruct #(DefaultPopup Variable)#
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = DefaultPopupView(DefaultViewStruct)
    ///    ````
    init(_ param: DefaultViewStruct) {
        self.param = param
    }
    
    /// Default Init
    init(){}
    
    deinit {
        self.param = nil
    }
    
    /// Base view corner radius
    /**
     ### Usage Example: ###
     ````
     let defaultView = DefaultPopupView(DefaultViewStruct)
     defaultView.baseViewRounded()
     ````
     */
    func baseViewRounded() {
        param?.baseView?.radius(15)
    }
    
    /// Default popup set Content Text
    ///
    /// - Parameter text: Text For Content
    /**
     ### Usage Example: ###
     ````
     let defaultView = DefaultPopupView(DefaultViewStruct)
     let text = "example"
     defaultView.seTContent(text)
     ````
     */
    func setContent(_ text: String){
        param?.contentText?.text = text
    }
    
    /// Add other popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - popup: popup
    func popupAdd(_ inView: UIView, popup: DefaultPopup) {
        inView.addSubview(popup)
        popup.snp.makeConstraints({ make in
            make.edges.equalTo(inView).inset(UIEdgeInsets.zero)
        })
    }
    
    /// Popup Show with Animated
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - popup: popup
    func popupShowAnimated(_ inView: UIView, popup: DefaultPopup) {
        popupAdd(inView, popup: popup)
        UIView.animate(withDuration: ANIMATION_DEFAULT, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.beginFromCurrentState, .layoutSubviews, .transitionCrossDissolve], animations: {
            popup.alpha = 1
        }, completion: nil)
    }
    
    /// Popup Dismiss
    ///
    /// - Parameters:
    ///   - callCloseCallback: finished Callback
    ///   - popup: popup
    func popupDismiss(_ callCloseCallback: Bool = true, popup: [DefaultPopup]) {
        let controller = DefaultController()
        for item in popup {
            UIView.animate(withDuration: ANIMATION_DEFAULT, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:
                [.beginFromCurrentState, .layoutSubviews, .transitionCrossDissolve], animations: {
                    item.alpha = 0
            }, completion: { isFinished in
                if isFinished {
                    controller.remove(callCloseCallback, popup: popup)
                }
            })
        }
    }
}
