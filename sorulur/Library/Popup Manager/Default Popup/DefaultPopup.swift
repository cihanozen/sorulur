//
//  DefaultPopup.swift
//  sorulur
//
//  Created by Sinan Özman on 9.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Default Popup Callback tag name
typealias DefaultPopupCallBack = (_ view: DefaultPopup) -> Void

/// Default POPUP
class DefaultPopup: UIView {
    /// On Close Callback
    var onClose: DefaultPopupCallBack?
    
    /// DefaultPopup Variable Copy in sturct with other class implement
    /// Default View Struct for other class
    var param: DefaultViewStruct {
        return DefaultViewStruct(with: self) ?? DefaultViewStruct()
    }
    
    /// Popup Content
    @IBOutlet var contentText: UILabel!
    /// Base popup View
    @IBOutlet var baseView: UIView!
}

// MARK: - Default Popup Tap Gesture Actions

extension DefaultPopup {
    /// Tap Gesture Action
    ///
    /// - Parameter _: Tap Gesture
    @IBAction func Action(_: Any) {
        //TODO: Touch Action
    }
}

// MARK: - DefaultViewDelegate

extension DefaultPopup: DefaultViewDelegate {
    /// Popup View Load functionn
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK: - SetupUI
        
        setupUI()
    }
}

// MARK: - DefaultControllerDelegate

extension DefaultPopup: DefaultControllerDelegate {
    /// Remove popup Function
    ///
    /// - Parameter callClose: CallBack
    func remove(_ callClose: Bool) {
        removePopup(callClose)
    }
    
    /// Dismiss popup
    ///
    /// - Parameters:
    ///   - animated: animated dismiss popup
    ///   - callCloseCallback: close finish callback
    ///   - popup: popup
    func dismiss(_ animated: Bool, callCloseCallback: Bool, popup: [DefaultPopup]) {
        dismissPopup(animated, callCloseCallback: callCloseCallback, popup: popup)
    }
    
    /// Other add popup
    func add() {
        //        addPopup()
    }
    
    /// Showing popup
    ///
    /// - Parameters:
    ///   - inView: Base View
    ///   - animated: animated showing popup
    ///   - popup: popup
    func show(_ inView: UIView, animated: Bool, popup: DefaultPopup) {
        log.debug(inView)
        log.debug(animated)
        showPopup(inView, animated: animated, popup: popup)
    }
    

}
