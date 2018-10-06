//
//  LoginController.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

/// Login Controller for LoginVC
class LoginController {
    
    /// LoginVC variables
    var param: LoginVCStruct?
    
    /// Login Controller İnits
    ///
    /// - Parameter param: LoginVCStruct
    ///### Usage Example: ###
    ///````
    /// let controller = LoginController(LoginVCStruct)
    ///````
    init(_ param: LoginVCStruct) {
        log.debug("Login Controller İnit")
        self.param = param
    }
    
    deinit {
        log.debug("Login Controller deinit")
        self.param = nil
    }
    
    /// Login Post
    ///    ### Usage Example: ###
    ///    ````
    ///    let contoller = LoginController(LoginVCStruct)
    ///    controller.loginPost()
    ///    ````
    func loginPost(){
        log.debug("login post started")
        let email: String = param?.emailTextField?.text ?? ""
        log.debug(email)
        let password: String = param?.passwordTextField?.text ?? ""
        log.debug(password)
        if email.isEmpty {
            log.warning("email is empty")
        } else if password.isEmpty {
            log.warning("password is empty")
        } else {
            let data = LoginRequest(email: email, password: password).toJSON()
            log.debug(data)
            Alamofire.request(URL_LOGIN, method: .post, parameters: data, encoding: JSONEncoding.default, headers: [:]).responseLogin { response in
                log.debug(response)
                response.result.ifSuccess {
                    log.debug("response is Success")
                    if let login = response.result.value {
                        log.debug("response result value not empty")
                        log.info("singleton set")
                        let singleton = Singleton.shared
                        singleton.userEmail = login.uyeEposta
                        singleton.userPassword = login.uyeSifre
                        singleton.userImage = login.uyeAvatar
                        singleton.userId = login.uyeID
                        singleton.userNick = login.uyeKadi
                        singleton.userStatus = login.uyeDurum
                        singleton.userPoints = login.uyePuan
                    }
                }
                    response.result.ifFailure {
                        log.error("Result is Failure")
                        print("hataalı panpa bu")
                    }
            }
        }
    }
}
