//
//  LeftMenuControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

protocol LeftMenuControllerDelegate {
    func setProfileImage()
    func setName()
    func setLevel()
}

extension LeftMenuControllerDelegate where Self: LeftMenuVC{
    // LeftMenuView Object
    private var leftMenuView: LeftMenuView {
        print("LeftMenu View")
        return LeftMenuView(self.param)
    }
    
    private var controller: LeftMenuController {
        print("LeftMenu Controller")
        return LeftMenuController(self.param)
    }
    
    func setProfileImage(){
        leftMenuView.setProfileImage(URL_PROFILE_PICTURE + controller.getAvatar())
    }
    
    func setName(){
        leftMenuView.setName(controller.getName())
    }
    
    func setLevel(){
        leftMenuView.setLevel(controller.getLevel())
    }
}
