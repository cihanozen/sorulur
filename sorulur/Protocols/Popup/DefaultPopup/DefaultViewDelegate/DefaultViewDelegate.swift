//
//  DefaultViewDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 9.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// DefaultView Delegegate Protocol
protocol DefaultViewDelegate {
    func setupUI()
    func setContent(text: String)
}

// MARK: - DefaultPOPUP

extension DefaultViewDelegate where Self: DefaultPopup {
        /// DefaultView Class Object
    var defaultView: DefaultPopupView {
        return DefaultPopupView(param)
    }
    
    /// SetupUI
    func setupUI() {
        defaultView.baseViewRounded()
    }
    
    /// Default Popup Set Content Function
    ///
    /// - Parameter text: Default Popup Content
    func setContent(text: String){
        defaultView.setContent(text)
    }
}
