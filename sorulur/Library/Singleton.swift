//
//  Singleton.swift
//  sorulur
//
//  Created by Sinan Özman on 6.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Singleton
class Singleton {
    /// Static User Email
    var userEmail: String?
    /// Static User Nick Name
    var userNick: String?
    /// Static User Id
    var userId: String?
    /// Static User Image
    var userImage: String?
    /// Static User Password
    var userPassword: String?
    /// Static User Status
    var userStatus: String?
    /// Static User Points
    var userPoints: String?

    /// Shared instanse
    static let shared = Singleton()

    /// Singleton İnit
    ///
    /// - Parameters:
    ///   - email: user email for saved static singleton
    ///   - nick: user nick name for saved static singleton
    ///   - id: user id for saved static singleton
    ///   - image: user image for saved static singleton
    ///   - pass: user password for saved static singleton
    ///   - status: user status for saved static singleton
    ///   - point: user point for saved static singleton
    init(email: String, nick: String, id: String, image: String, pass: String, status: String, point: String) {
        userEmail = email
        userNick = nick
        userId = id
        userImage = image
        userPassword = pass
        userStatus = status
        userPoints = point
    }

    /// Blank İnit
    init() {}
}
