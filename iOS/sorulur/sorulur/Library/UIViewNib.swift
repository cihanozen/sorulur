//
//  UIViewNib.swift
//  sorulur
//
//  Created by Sinan Özman on 7.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

//extension UIView {
//    public class func fromNib(_ nibNameOrNil: String? = nil) -> Self {
//        return fromNib(nibNameOrNil, type: self)
//    }
//
//    public class func fromNib<T: UIView>(_ nibNameOrNil: String? = nil, type _: T.Type) -> T {
//        let v: T? = fromNib(nibNameOrNil, type: T.self)
//        return v!
//    }
//
//    public class func fromNib<T: UIView>(_ nibNameOrNil: String? = nil, type _: T.Type) -> T? {
//        var view: T?
//        let name: String
//        if let nibName = nibNameOrNil {
//            name = nibName
//        } else {
//            // Most nibs are demangled by practice, if not, just declare string explicitly
//            name = nibName
//        }
//        if let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) {
//            for v in nibViews {
//                if let tog = v as? T {
//                    view = tog
//                }
//            }
//        }
//
//        return view
//    }
//
//    public class var nibName: String {
//        let name = "\(self)".components(separatedBy: ".").first ?? ""
//        return name
//    }
//
//    public class var nib: UINib? {
//        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
//            return UINib(nibName: nibName, bundle: nil)
//        } else {
//            return nil
//        }
//    }
//}
