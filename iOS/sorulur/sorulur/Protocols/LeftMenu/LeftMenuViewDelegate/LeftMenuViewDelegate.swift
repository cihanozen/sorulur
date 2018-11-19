//
//  LeftMenuViewDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

protocol LeftMenuViewDelegate {
    func roundedProfileImage()
}

extension LeftMenuViewDelegate where Self: LeftMenuVC {
    func roundedProfileImage(){
        LeftMenuView(view: self.imageView).viewEditCornerRadius(30, true)
    }
}
