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
        log.debug("Struct init")
        self.param = param
    }
    
    /// Default init
    init(){}
    
    deinit {
        log.debug("Deinit")
        self.param = nil
    }
    
    public func getAvatar() -> UIImage{
        if let model = Singleton.shared.userImage {
            if !model.isEmpty {
                return UIImage(named: model)!
            } else {
                return UIImage(named: "")!
            }
        } else {
            return UIImage()
        }
    }
}
