//
//  LoginVCStruct.swift
//  Sorulur
//
//  Created by Sinan Özman on 4.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import Cocoa

struct LoginVCStruct {
    weak var view: NSView?
}

extension LoginVCStruct {
    init?(with view: LoginVC){
        self.view = view.view
    }
    
    mutating func reset(){
        self.view = nil
    }
}
