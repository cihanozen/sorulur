//
//  LoginController.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

/// Login Controller for LoginVC
class LoginController {
    /// LoginVC variables
    var param: LoginVCStruct?

    /// Login Controller İnits
    ///
    /// - Parameter param: LoginVCStruct
    /// ### Usage Example: ###
    /// ````
    /// let controller = LoginController(LoginVCStruct)
    /// ````
    init(_ param: LoginVCStruct) {
        print("Login Controller İnit")
        self.param = param
    }

    deinit {
        print("Login Controller deinit")
        self.param = nil
    }

    /// Login Post
    ///    ### Usage Example: ###
    ///    ````
    ///    let contoller = LoginController(LoginVCStruct)
    ///    controller.loginPost()
    ///    ````
    func loginPost(_ base: LoginVC , completion: ((_ response: Bool) -> ())? = nil) {
        print("login post started")
        let email: String = param?.emailTextField?.text ?? ""
        print(email)
        let password: String = param?.passwordTextField?.text ?? ""
        print(password)
        if email.isEmpty {
            ErrorPopupManager.shared.showPopup(base, animated: true, type: 0)
        } else if password.isEmpty {
            print("password is empty", color: .yellow)
            ErrorPopupManager.shared.showPopup(base, animated: true, type: 1)
        } else {
            let data = LoginRequest(email: email, password: password).toJSON()
            print(data)
            Alamofire.request(URL_LOGIN, method: .post, parameters: data, encoding: JSONEncoding.default, headers: [:]).responseLogin { response in
                print(response)
                response.result.ifSuccess {
                    print("response is Success")
                    if let login = response.result.value {
                        print("response result value not empty")
                        print("singleton set",color: .blue)
                        let singleton = Singleton.shared
                        singleton.userEmail = login.uyeEposta
                        singleton.userPassword = login.uyeSifre
                        singleton.userImage = login.uyeAvatar
                        singleton.userId = login.uyeID
                        singleton.userNick = login.uyeKadi
                        singleton.userStatus = login.uyeDurum
                        singleton.userPoints = login.uyePuan
                        completion!(true)
                    }
                }
                response.result.ifFailure {
                    print("Result is Failure", color: .red)
                    print("hataalı panpa bu")
                    completion!(false)
                }
            }
        }
    }
}
