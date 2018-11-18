//
//  ErrorViewStruct.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Error Popup Variable Structs
struct ErrorViewStruct {
    weak var baseView: UIView?
    weak var logoView: UIImageView?
    weak var titleTextLabel: UILabel?
    weak var contentTextLabel: UILabel?
    var onClose: ErrorPopupCallBack?
}

// MARK: - Error View Struct initilasion and reset variables

extension ErrorViewStruct {
    /// LoginVCStruct İnit
    ///
    /// - Parameter view: ErrorPopup
    ///    ### Usage Example: ###
    ///    ````
    ///    ErrorViewStruct(ErrorPopup.self)
    ///    ````
    init?(with view: ErrorPopup) {
        print("Login VC Struct init")
        baseView = view.baseView
        logoView = view.logoView
        titleTextLabel = view.titleTextLabel
        contentTextLabel = view.contentTextLabel
        onClose = view.onClose
    }

    /// Reset Variables
    ///    ### Usage Example: ###
    ///    ````
    ///    let param = ErrorViewStruct
    ///    param.reset()
    ///    ````
    mutating func reset() {
        print("Login VC Struct reset")
        baseView = nil
        logoView = nil
        titleTextLabel = nil
        contentTextLabel = nil
        onClose = nil
    }
}
