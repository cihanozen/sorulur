//
//  AppDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit
#if DEBUG
import CocoaDebug
#endif

/// AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    /// İphone Screen
    var window: UIWindow?

    /// Document Directory for log
    let documentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()

    /// Cache Directory for log
    let cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()

    /// AppDelegate Finish Launch
    ///
    /// - Parameters:
    ///   - application: UIApplication
    ///   - launchOptions: UIApplication.LaunchOptionKey
    /// - Returns: Bool
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
        CocoaDebug.enable()
        #endif
        return true
    }
}

//Step 3.
public func print<T>(file: String = #file, function: String = #function, line: Int = #line, _ message: T, color: UIColor = .green) {
    #if DEBUG
    swiftLog(file, function, line, message, color)
    #endif
}
