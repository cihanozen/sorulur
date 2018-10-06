//
//  UIColorHex.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// İnit Hex String
    ///
    /// - Parameter hexString: hexString
    private convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    /// Hex String Code
    ///
    /// - Parameter code: Hex String
    /// - Returns: UIColor
    ///    ### Usage Example: ###
    ///    ````
    ///    UIColor.hex("#fffff")
    ///    ````
    class func hex(_ code: String) -> UIColor {
        return UIColor(hexString: code)
    }
    
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        let argb: Int = (Int)(a*255)<<24 | (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return (a != 1) ? String(format:"#%08x", argb).uppercased() : String(format:"#%06x", rgb).uppercased()
    }
}
