//
//  AppDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit
import XCGLogger

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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
        log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true)
        #else
        log.setup(level: .severe, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true)
        if let consoleLog = log.destination(withIdentifier: XCGLogger.Constants.baseConsoleDestinationIdentifier) as? ConsoleDestination {
            consoleLog.logQueue = XCGLogger.logQueue
        }
        #endif
        return true
    }
}

