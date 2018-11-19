//
//  ErrorPopup.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit

/// Error Popup Callback tag name
typealias ErrorPopupCallBack = (_ view: ErrorPopup) -> Void
/// Error POPUP
class ErrorPopup: UIView {
    /// On Close CallBack
    var onClose: ErrorPopupCallBack?
    /// ErrorPopup Variable Copy in sturct with other class implement
    /// Error View Struct for other class
    var param: ErrorViewStruct {
        print("Login VC Struct")
        return ErrorViewStruct(with: self) ?? ErrorViewStruct()
    }

    /// Base popup View
    @IBOutlet var baseView: UIView!
    /// Popup image view
    @IBOutlet var logoView: UIImageView!
    /// Popup Title
    @IBOutlet var titleTextLabel: UILabel!
    /// Popup Content
    @IBOutlet var contentTextLabel: UILabel!
}

// MARK: - Error Popup Tap Gesture Actions

extension ErrorPopup {
    /// Tap Gesture Action
    ///
    /// - Parameter _: Tap Gesture
    @IBAction func Action(_: Any) {
        // MARK: - Dissmiss popup
        
        dismiss(true, callCloseCallback: true, popup: ErrorPopupManager.shared.popups)
    }
}

// MARK: - ErrorViewDelegate

extension ErrorPopup: ErrorViewDelegate {
    /// Popup View Load functionn
    override func awakeFromNib() {
        super.awakeFromNib()

        // MARK: - SetupUI

        setupUI()
    }
}

// MARK: - ErrorControllerDelegate

extension ErrorPopup: ErrorControllerDelegate {
    /// Remove popup Function
    ///
    /// - Parameter callClose: CallBack
    func remove(_ callClose: Bool = true) {
        removePopup(callClose)
    }

    /// Dismiss popup
    ///
    /// - Parameters:
    ///   - animated: animated dismiss popup
    ///   - callCloseCallback: close finish callback
    ///   - popup: popup
    func dismiss(_ animated: Bool = true, callCloseCallback: Bool = true, popup: [ErrorPopup]) {
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
    func show(_ inView: UIView, animated: Bool, popup: ErrorPopup) {
        print(inView)
        print(animated)
        showPopup(inView, animated: animated, popup: popup)
    }
}
