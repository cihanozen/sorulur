//
//  NSViewGradient.swift
//  Sorulur
//
//  Created by Sinan Özman on 4.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    /// applyGranient
    ///
    /// - Parameter colours: UIColor array
    /// - returns: Void function
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = UIView()
    ///    view.applyGranient(colours: [UIColor.white])
    ///    ````
    func applyGranient(colours: [NSColor]) {
        applyGranient(colours: colours, locations: nil)
    }
    
    /// applyGranient with location
    ///
    /// - Parameters:
    ///   - colours: UIColor array
    ///   - locations: An object wrapper for primitive scalar numeric values for path
    ///    ### Usage Example: ###
    ///    ````
    ///    let view = UIView()
    ///    view.applyGranient(colours: [UIColor.white] , locations: [0.0,0.0])
    ///    ````
    func applyGranient(colours: [NSColor], locations: [NSNumber]?) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colours.map {
            $0.cgColor
        }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        layer?.insertSublayer(gradient, at: 0)
    }
}

