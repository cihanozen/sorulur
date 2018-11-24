//
//  HomeCellView.swift
//  sorulur
//
//  Created by Sinan Özman on 24.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

class HomeCellView {
    var param: HomeCellStructs?
    
    init(_ param: HomeCellStructs) {
        print("HomeCell View init")
        self.param = param
    }
    
    deinit {
        self.param = nil
    }
    
    public func profileImageCornerRadius( _ cradius: CGFloat, _ clipToBounds: Bool) {
        param?.profileViewImage.clipsToBounds = clipToBounds
        param?.profileViewImage.layer.cornerRadius = cradius
    }
}
