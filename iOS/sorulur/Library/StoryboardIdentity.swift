//
//  StoryboardIdentity.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

   /// StoryboardIdentifier Gloabl
   ///
   /// - LOGINID: LoginVC Storyboard Identifier
   /// - SIGNUPID: SignUpVC Storyboard Identifier
   /// - ERROR_POPUP: ErrorPopup Storyboard Identifier
   /// - DEFAULT_POPUP: DefaultPopup Storyboard Identifier
public enum StoryboardIdentifier: String {
    /// LoginVC identifier
    case LOGINID = "LoginVC"
    case SIGNUPID = "SignUpVC"
    case ERROR_POPUP = "ErrorPopup"
    case DEFAULT_POPUP = "DefaultPopup"
    case NAVIGATION = "Navigation"
    case TABBAR = "TabBarViewController"
    case LEFTMENU = "LeftMenuViewController"
    case LEFTMENUTABLECELLTYPE1 = "LeftMenuTableCellType1"
    case LEFTMENUTABLECELLTYPE2 = "LeftMenuTableCellType2"
}

