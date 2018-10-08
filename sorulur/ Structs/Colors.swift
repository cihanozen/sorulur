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
    static let GRADIENTSTART = COLORS.HEX("#8274AA")
    static let GRADIENTEND = COLORS.HEX("#A6538D")

    static let BORDER_WHITE = COLORS.RGB(255, green: 255, blue: 255)

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
