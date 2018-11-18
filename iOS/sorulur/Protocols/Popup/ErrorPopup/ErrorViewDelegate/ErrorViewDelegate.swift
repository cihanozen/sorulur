//
//  ErrorViewDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// ErrorView Delegegate Protocol
protocol ErrorViewDelegate {
    func setupUI()
    func setTitle(text: String)
    func setContent(text: String)
}

// MARK: - ErrorPOPUP

extension ErrorViewDelegate where Self: ErrorPopup {
    /// ErrorView Class Object
    var errorView: ErrorPopupView {
        print("LoginView")
        return ErrorPopupView(param)
    }

    /// SetupUI
    func setupUI() {
        print("setupUI")
        errorView.baseViewRounded()
    }

    /// Error Popup Set Title Function
    ///
    /// - Parameter text: Error Popup Title
    func setTitle(text: String) {
        errorView.setTitle(text)
    }

    /// Error Popup Set Content Function
    ///
    /// - Parameter text: Error Popup Content
    func setContent(text: String) {
        errorView.setContent(text)
    }
}
