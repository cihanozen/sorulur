//
//  File.swift
//  sorulur
//
//  Created by Sinan Özman on 9.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

struct DefaultViewStruct {
    weak var baseView: UIView?
    weak var contentText: UILabel?
    var onClose: DefaultPopupCallBack?
}

extension DefaultViewStruct {
    init?(with view: DefaultPopup) {
        baseView = view.baseView
        contentText = view.contentText
    }
    
    mutating func reset() {
        baseView = nil
        contentText = nil
    }
}
