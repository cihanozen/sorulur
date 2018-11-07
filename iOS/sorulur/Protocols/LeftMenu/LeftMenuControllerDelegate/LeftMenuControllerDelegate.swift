//
//  LeftMenuControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
//import SDWebImage

protocol LeftMenuControllerDelegate {
    func setProfileImage()
}

extension LeftMenuControllerDelegate where Self: LeftMenuVC{
    // LeftMenuView Object
    private var leftMenuView: LeftMenuView {
        log.debug("LeftMenu View")
        return LeftMenuView(self.param)
    }
    
    private var controller: LeftMenuController {
        log.debug("LeftMenu Controller")
        return LeftMenuController(self.param)
    }
    
    func setProfileImage(){
        leftMenuView.setProfileImage(controller.getAvatar())
    }
}
