//
//  ErrorPopupView.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

/// ErrorPopupView for ErrorPopup
class ErrorPopupView {
    /// ErrorPopup Variables for mapping
    var param: ErrorViewStruct?

    /// ErrorPopupView inits
    ///
    /// - Parameter param: ErrorViewStruct #(ErrorPopup Variable)#
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = ErrorPopupView(ErrorViewStruct)
    ///    ````
    init(_ param: ErrorViewStruct) {
        log.debug("Login View İnit")
        self.param = param
    }

    /// Default Init
    init() {}

    deinit {
        log.debug("login view deinit")
        self.param = nil
    }

    /// Base view corner radius
    /**
     ### Usage Example: ###
     ````
     let errorView = ErrorPopupView(ErrorViewStruct)
     errorView.baseViewRounded()
     ````
     */
    func baseViewRounded() {
        param?.baseView?.radius(15)
    }

    /// Error popup set icon
    ///
    /// - Parameters:
    ///   - image: Image for imageview
    /**
     ### Usage Example: ###
     ````
     let errorView = ErrorPopupView(ErrorViewStruct)
     let image = UIImage()
     errorView.setIcon(image)
     ````
     */
    func setIcon(_ image: UIImage) {
        param?.logoView?.image = image
    }

    /// Error popup set Title Text
    ///
    /// - Parameter title: Text For title
    /**
     ### Usage Example: ###
     ````
     let errorView = ErrorPopupView(ErrorViewStruct)
     let text = "example"
     errorView.seTtitle(text)
     ````
     */
    func setTitle(_ title: String) {
        param?.titleTextLabel?.text = title
    }

    /// Error popup set Content Text
    ///
    /// - Parameter text: Text For Content
    /**
     ### Usage Example: ###
     ````
     let errorView = ErrorPopupView(ErrorViewStruct)
     let text = "example"
     errorView.seTContent(text)
     ````
     */
    func setContent(_ text: String) {
        param?.contentTextLabel?.text = text
    }

    /// Add other popup
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - popup: popup
    func popupAdd(_ inView: UIView, popup: ErrorPopup) {
        inView.addSubview(popup)
        log.debug(inView)
        popup.snp.makeConstraints({ make in
            make.edges.equalTo(inView).inset(UIEdgeInsets.zero)
        })
    }

    /// Popup Show with Animated
    ///
    /// - Parameters:
    ///   - inView: base View
    ///   - popup: popup
    func popupShowAnimated(_ inView: UIView, popup: ErrorPopup) {
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
    func popupDismiss(_ callCloseCallback: Bool = true, popup: [ErrorPopup]) {
        let controller = ErrorController()
        for item in popup {
            UIView.animate(withDuration: ANIMATION_DEFAULT, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:
                [.beginFromCurrentState, .layoutSubviews, .transitionCrossDissolve], animations: {
                    item.alpha = 0
                }, completion: { isFinished in
                    if isFinished {
                        controller.remove(callCloseCallback, popup: [item])
                    }
            })
        }
    }
}
