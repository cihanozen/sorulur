//
//  HomeController.swift
//  sorulur
//
//  Created by Sinan Özman on 24.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

/// Left Menu Controller For LeftMenuVC
class HomeController {
    /// LeftMenuVC variables
    var param: HomeVCStructs?
    
    /// LeftMenu Controller İnits
    ///
    /// - Parameter param: LeftMenuStruct
    /// ### Usage Example: ###
    /// ````
    /// let controller = LeftMenuController(LeftMenuStruct)
    /// ````
    init(_ param: HomeVCStructs){
        print("Struct init")
        self.param = param
    }
    
    /// Default init
    init(){}
    
    deinit {
        print("Deinit")
        self.param = nil
    }
    
    func allQuestion(completion: ((_ finish: AllQuestion) -> ())? = nil) {
        Alamofire.request(URL_GET_ALL_QUESTION).responseAllQuestion { response in
            if let allQuestion = response.result.value {
                    completion!(allQuestion)
            }
        }
    }
}

