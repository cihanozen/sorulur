//
//  LeftMenuController.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Left Menu Controller For LeftMenuVC
class LeftMenuController {
    /// LeftMenuVC variables
    var param: LeftMenuVCStructs?
    
    /// LeftMenu Controller İnits
    ///
    /// - Parameter param: LeftMenuStruct
    /// ### Usage Example: ###
    /// ````
    /// let controller = LeftMenuController(LeftMenuStruct)
    /// ````
    init(_ param: LeftMenuVCStructs){
        print("Struct init")
        self.param = param
    }
    
    /// Default init
    init(){}
    
    deinit {
        print("Deinit")
        self.param = nil
    }
    
    public func getAvatar() -> String{
        if let model = Singleton.shared.userImage {
            if !model.isEmpty {
                return model
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    public func getName() -> String {
        if let model = Singleton.shared.userNick {
            if !model.isEmpty {
                return model
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    public func getLevel() -> String {
        if let model = Singleton.shared.userPoints {
            if !model.isEmpty {
                return model
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
}
