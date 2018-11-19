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
    static let GREEN_SHADOW = COLORS.RGB(0, green: 162, blue: 23, alpha: 0.82)
    static let BLACK_SHADOW = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.25)
    static let GRAY_SHADOW = COLORS.RGB(65, green: 50, blue: 122, alpha: 0.12)
    static let GRAY_DARK_SHADOW = COLORS.RGB(98, green: 125, blue: 147, alpha: 0.21)
    static let BLACK_SHADOW_LIGHTER = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.20)
    static let BLACK_SHADOW_LIGHTEST = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.06)
    static let WHITE_BG = COLORS.RGB(248, green: 248, blue: 248)
    static let GRAY_PLACEHOLDER = COLORS.RGB(193, green: 200, blue: 207)
    static let BLUE = COLORS.RGB(0, green: 124, blue: 245)
    //    static let BLUE_NAV_BAR = COLORS.RGB(40, green: 145, blue: 247)
    static let NAV_BAR_SHADOW = COLORS.RGB(0, green: 0, blue: 0, alpha: 0.25)
    //    static let BLUE_STATUS_BAR = COLORS.RGB(0, green: 97, blue: 215)
    static let BLACK = COLORS.RGB(73, green: 81, blue: 91)
    static let BLACK_SOFT = COLORS.RGB(73, green: 81, blue: 91, alpha: 0.70)
    static let BLACK_TRANSPARENT = COLORS.RGB(73, green: 81, blue: 91, alpha: 0.50)
    static let GRAY = COLORS.RGB(119, green: 126, blue: 134)
    static let WHITE_PASSIVE = COLORS.RGB(255, green: 255, blue: 255, alpha: 0.30)
    static let GREEN_ON_BLUE = COLORS.RGB(87, green: 210, blue: 173)
    static let BLUE_SKY = COLORS.RGB(14, green: 137, blue: 255)
    static let GRAY_PASSIVE = COLORS.RGB(193, green: 200, blue: 207, alpha: 0.80)
    static let GREEN = COLORS.RGB(0, green: 189, blue: 67)
    static let WHITE_HALF = COLORS.RGB(255, green: 255, blue: 255, alpha: 0.50)
    //static let BLUE_BORDER = COLORS.RGB(39, green: 77, blue: 158)
    static let BLUE_BORDER = COLORS.RGB(170, green: 182, blue: 212)
    static let MARIGOLD = COLORS.RGB(255, green: 194, blue: 0)
    static let ORANGE_YELLOW = COLORS.RGB(255, green: 234, blue: 1)
    static let ORANGE_YELLOW_2 = COLORS.RGB(255, green: 170, blue: 0)
    static let ORANGE_YELLOW_2_ALPHA = COLORS.RGB(255, green: 170, blue: 0, alpha: 0.70)
    static let GRAY_UNPUBLISHED = COLORS.RGB(128, green: 147, blue: 170)
    static let DEEP_SEA_BLUE = COLORS.RGB(4, green: 95, blue: 126, alpha: 0.83)
    static let POPUP_WHITE = COLORS.RGB(242, green: 242, blue: 242)
    static let SPLASH_BLUE = COLORS.RGB(0, green: 95, blue: 251)
    static let GRAY_DASHED_BORDER = COLORS.RGB(151, green: 151, blue: 151)
    static let CV_OFF_WHITE = COLORS.RGB(255, green: 250, blue: 240)
    static let CV_LIGHT_PINK = COLORS.RGB(255, green: 237, blue: 237)
    static let CV_BRIGHT_ORANGE = COLORS.RGB(255, green: 95, blue: 5)
    static let CV_GRAD_FROM = COLORS.RGB(128, green: 249, blue: 183)
    static let CV_GRAD_TO = COLORS.RGB(0, green: 182, blue: 52)
    static let VIEWED_GRAD_FROM = COLORS.RGB(101, green: 160, blue: 189)
    static let VIEWED_GRAD_MIDDLE = COLORS.RGB(32, green: 87, blue: 146)
    static let VIEWED_GRAD_TO = COLORS.RGB(54, green: 91, blue: 172)
    static let STATUS_SEEN = COLORS.RGB(255, green: 171, blue: 11)
    //New Design Colors
    static let ORANGE = COLORS.RGB(247, green: 176, blue: 26)
    static let ORANGE_SHADOW = COLORS.RGB(195, green: 135, blue: 10, alpha: 0.47)

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
