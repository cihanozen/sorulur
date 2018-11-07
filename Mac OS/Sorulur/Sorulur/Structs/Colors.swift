//
//  Colors.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import Cocoa

/// Colors Variable
struct COLORS {
    static let GRADIENTSTART_LOGIN = COLORS.HEX("#8274AA")
    static let GRADIENTEND_LOGIN = COLORS.HEX("#A6538D")
    static let GRADIENTSTART_SIGNUP = COLORS.HEX("#33AAD6")
    static let GRADIENTEND_SIGNUP = COLORS.HEX("#26A98B")
    
    static let BORDER_WHITE = COLORS.RGB(255, green: 255, blue: 255)
    static let BORDER_BLACK = COLORS.RGB(18, green: 18, blue: 18)
    static let BORDER_PURPLE = COLORS.RGB(118, green: 63, blue: 103)
    
    /// RGB Color convert to UIColor
    ///
    /// - Parameters:
    ///   - red: RGB Red Value
    ///   - green: RGB Green Value
    ///   - blue: RGB Blue Valur
    ///   - alpha: Alpha
    /// - Returns: UIColor
    /// - Warning: red , green, blue is not optional
    ///    ### Usage Example: ###
    ///    ````
    ///    static let BORDER_WHITE = COLORS.RGB(255, green: 255, blue: 255)
    ///    ````
    static func RGB(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> NSColor {
        return NSColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    /// Hex String Color convert to UIColor
    ///
    /// - Parameter hexString: hex String
    /// - Returns: UIColor
    ///    ### Usage Example: ###
    ///    ````
    ///    static let GRADIENTSTART = COLORS.HEX("#8274AA")
    ///    ````
    static func HEX(_ hexString: String) -> NSColor {
        return NSColor.hex(_: hexString)
    }
}
