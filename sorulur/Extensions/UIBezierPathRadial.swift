//
//  UIBezierPathRadial.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Bezier Path

extension UIBezierPath {
    /// QuarterCircle
    enum QuarterCircleQuadrant {
        case topLeft, bottomLeft, topRight, bottomRight, topLeftThreeQuarterCircle, bottomRightThreeQuarterCircle, bottomLeftThreeQuarterCircle, topRightThreeQuarterCircle

        var startAngle: CGFloat {
            switch self {
            case .bottomLeft:
                return CGFloat.pi
            case .bottomLeftThreeQuarterCircle:
                return CGFloat.pi
            case .topLeft:
                return CGFloat.pi
            case .bottomRight:
                return 0
            case .topRight:
                return 0
            case .topRightThreeQuarterCircle:
                return 0
            case .topLeftThreeQuarterCircle:
                return CGFloat.pi
            case .bottomRightThreeQuarterCircle:
                return 0
            }
        }

        var endAngle: CGFloat {
            switch self {
            case .bottomLeft:
                return CGFloat.pi
            case .bottomLeftThreeQuarterCircle:
                return CGFloat.pi
            case .topLeft:
                return CGFloat.pi * 1.5
            case .bottomRight:
                return CGFloat.pi
            case .topRight:
                return CGFloat.pi * 1.5
            case .topRightThreeQuarterCircle:
                return CGFloat.pi * 1.5
            case .topLeftThreeQuarterCircle:
                return CGFloat.pi * 1.5
            case .bottomRightThreeQuarterCircle:
                return CGFloat.pi
            }
        }

        var clockwise: Bool {
            switch self {
            case .bottomLeft:
                return false
            case .topLeft:
                return true
            case .bottomRight:
                return true
            case .topRight:
                return false
            case .bottomLeftThreeQuarterCircle:
                return true
            case .topRightThreeQuarterCircle:
                return true
            case .topLeftThreeQuarterCircle:
                return false
            case .bottomRightThreeQuarterCircle:
                return false
            }
        }
    }

    /// Create Path
    ///
    /// - Parameters:
    ///   - centre: Position
    ///   - radius: radius value
    ///   - quadrant: QuarterCircleQuadrant type
    convenience init(quarterCircleCentre centre: CGPoint, radius: CGFloat, quadrant: QuarterCircleQuadrant) {
        self.init()
        move(to: CGPoint(x: centre.x, y: centre.y))
        addArc(withCenter: centre, radius: radius, startAngle: quadrant.startAngle, endAngle: quadrant.endAngle, clockwise: quadrant.clockwise)
        close()
    }
}
