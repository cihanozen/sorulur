//
//  LoginRequest.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Login Request Model
class LoginRequest: Codable {
    /// Email Variable
    var email: String?
    /// Password Variable
    var password: String?
    
    /// İnit Variable
    ///
    /// - Parameters:
    ///   - email: user email for login
    ///   - password: user password for login
    ///    ### Usage Example: ###
    ///    ````
    ///    LoginRequest(email: "example@example.com", password: "123456789")
    ///    ````
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
    
    deinit {
        self.email = nil
        self.password = nil
    }
    
    /// model variable convert json Array
    ///
    /// - Returns: String json key and String json Value
    ///    ### Usage Example: ###
    ///    ````
    ///    LoginRequest(email:"example@example.com", password: "123456789").toJSON()
    ///    ````
    func toJSON() -> [String: Any] {
        return [
            DICT_KEY_LOGIN_EMAIL: email as Any,
            DICT_KEY_LOGIN_PASSWORD: password as Any
        ]
    }
}
