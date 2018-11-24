//
//  Colors.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Colors Variable
struct COLORS {
    static let GRADIENTSTART_LOGIN = COLORS.HEX("#8274AA")
    static let GRADIENTEND_LOGIN = COLORS.HEX("#A6538D")
    static let GRADIENTSTART_SIGNUP = COLORS.HEX("#33AAD6")
    static let GRADIENTEND_SIGNUP = COLORS.HEX("#26A98B")

    static let BORDER_WHITE = COLORS.RGB(255, green: 255, blue: 255)
    static let BORDER_BLACK = COLORS.RGB(18, green: 18, blue: 18)
    static let BORDER_PURPLE = COLORS.RGB(118, green: 63, blue: 103)
    
    static let NAV_PURPLE = COLORS.RGB(163, green: 85, blue: 139)

    static let BLACK_SHADOW = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.25)
    static let BLACK_SHADOW_LIGHTER = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.20)
    static let BLACK_SHADOW_LIGHTEST = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.06)
    static let WHITE_BG = COLORS.RGB(248, green: 248, blue: 248)
    static let GRAY_PLACEHOLDER = COLORS.RGB(193, green: 200, blue: 207)
    static let NAV_BAR_SHADOW = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.25)
    static let BLACK = COLORS.RGB(73, green: 81, blue: 91)
    static let BLACK_SOFT = COLORS.RGB(73, green: 81, blue: 91, alpha: 0.70)
    static let BLACK_TRANSPARENT = COLORS.RGB(73, green: 81, blue: 91, alpha: 0.50)
    static let GRAY = COLORS.RGB(119, green: 126, blue: 134)
    static let WHITE_PASSIVE = COLORS.RGB(255, green: 255, blue: 255, alpha: 0.30)
    static let WHITE_HALF = COLORS.RGB(255, green: 255, blue: 255, alpha: 0.50)
    
    static let FEMALE = COLORS.HEX("#b10164")
    static let MALE = COLORS.HEX("#2b8cd8")

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
    static func RGB(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }

    /// Hex String Color convert to UIColor
    ///
    /// - Parameter hexString: hex String
    /// - Returns: UIColor
    ///    ### Usage Example: ###
    ///    ````
    ///    static let GRADIENTSTART = COLORS.HEX("#8274AA")
    ///    ````
    static func HEX(_ hexString: String) -> UIColor {
        return UIColor.hex(_: hexString)
    }
}
