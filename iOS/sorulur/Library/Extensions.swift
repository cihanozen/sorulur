//
//  Extensions.swift
//  Yenibiris
//
//  Created by Barış Özer on 10/31/16.
//  Copyright © 2016 Yenibiris. All rights reserved.
//

import Foundation
import UIKit

func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}

extension Date {
    static func currentGaps() -> TIME_GAPS {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = formatter.string(from: Date())
        let array = dateString.components(separatedBy: " ")
        if let currentTimeStr = array.last {
            let arrayHour = currentTimeStr.components(separatedBy: ":")
            if let currentHour = arrayHour.first {
                if let hour = Int(currentHour) {
                    if hour >= 0 && hour < 6 {
                        return .night
                    }
                    else if hour >= 6 && hour < 12 {
                        return .morning
                    }
                    else if hour >= 12 && hour < 18 {
                        return .afternoon
                    }
                    else if hour >= 18 && hour < 24 {
                        return .evening
                    }
                }
            }
        }
        return .afternoon
    }
}

extension UITabBarController {
    func setTabBarVisible(_ visible:Bool, animated:Bool) {
        
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBar.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        // animate the tabBar
        UIView.animate(withDuration: animated ? ANIMATION_DEFAULT_FASTER : 0.0, animations: {
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + offsetY)
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        })
    }
    
    func tabBarIsVisible() -> Bool {
        return self.tabBar.frame.origin.y < self.view.frame.maxY
    }
}

extension UIViewController {
    static func adjustNavBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(color: COLORS.BLUE, size: CGSize(width: screenWidth(), height: 44)), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
//                                                            NSAttributedString.Key.font: FONT.semibold(20)]
        let imageBack = UIImage(named: "ic_back")
        UINavigationBar.appearance().backIndicatorImage = imageBack
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = imageBack
//        OldMethods.adjustBarButtonItem()
    }
    
    static func resetNavBar() {
        UINavigationBar.appearance().setBackgroundImage(nil, for: .default)
        UINavigationBar.appearance().shadowImage = nil
        UINavigationBar.appearance().backIndicatorImage = nil
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = nil
//        OldMethods.resetBarButtonItem()
    }
    
    static func adjustTabbar() {
        UITabBar.appearance().tintColor = COLORS.ORANGE
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:COLORS.GRAY_PLACEHOLDER], for: UIControl.State())
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:COLORS.ORANGE], for: .highlighted)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:COLORS.ORANGE], for: .selected)
    }
    
    func hideNavBarLine(_ willHide:Bool = true) {
        if willHide {
            self.navigationController?.navigationBar.hideBottomLine()
        }
        else {
            self.navigationController?.navigationBar.showBottomLine()
        }
    }
    
    static var currentController: UIViewController? {
        func currentViewController(_ viewController: UIViewController) -> UIViewController {
            if let presented = viewController.presentedViewController {
                return currentViewController(presented)
            } else if let navigationController = viewController as? UINavigationController,
                let topController = navigationController.topViewController {
                return currentViewController(topController)
            } else if let tabbarController = viewController as? UITabBarController,
                let selectedController = tabbarController.selectedViewController {
                return currentViewController(selectedController)
            } else {
                return viewController
            }
        }
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            return currentViewController(viewController)
        } else {
            return nil
        }
    }
    
    func findAndResignFirstResponder() {
        let _ = self.view.findAndResignFirstResponder()
    }
    
    func findAndGetFirstResponder() -> AnyObject? {
        return self.view.findAndGetFirstResponder()
    }
    
    func push(_ vc:UIViewController, animated:Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    func resignAndPush(_ vc:UIViewController, animated:Bool = true) {
        findAndResignFirstResponder()
        push(vc, animated: animated)
    }
    
    func resignAndPushLikePresent(_ vc:UIViewController) {
        findAndResignFirstResponder()
        if let window = self.view.window {
            let transition = CATransition()
            transition.duration = ANIMATION_DEFAULT
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromTop
            //            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            window.layer.add(transition, forKey: kCATransition)
            push(vc, animated: false)
        }
        else {
            push(vc)
        }
    }
    
    func pop(_ animated:Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(_ animated:Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
    func resignAndPop(_ animated:Bool = true) {
        findAndResignFirstResponder()
        pop(animated)
    }
    
    func popTo(_ vc:UIViewController, animated:Bool = true) {
        self.navigationController?.popToViewController(vc, animated: animated)
    }
    
    func resignAndPopTo(_ vc:UIViewController, animated:Bool = true) {
        findAndResignFirstResponder()
        popTo(vc, animated: animated)
    }
    
    func presentVC(_ vc:UIViewController, animated:Bool = true, completion: (() -> Void)? = nil) {
        self.present(vc, animated: animated, completion: completion)
    }
    
    func resignAndPresentLikePush(_ toVC:UIViewController) {
        findAndResignFirstResponder()
        if let window = self.view.window {
            let transition = CATransition()
            transition.duration = ANIMATION_DEFAULT
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            //            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            window.layer.add(transition, forKey: kCATransition)
            presentVC(toVC, animated: false)
        }
        else {
            presentVC(toVC)
        }
    }
    
    func dismissVC(_ animated:Bool = true, completion: (() -> Void)? = nil) {
        findAndResignFirstResponder()
        self.dismiss(animated: animated, completion: completion)
    }
    
    func resignAndDismissLikePush() {
        findAndResignFirstResponder()
        if let window = self.view.window {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.reveal
            transition.subtype = CATransitionSubtype.fromLeft
            //            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            window.layer.add(transition, forKey: kCATransition)
            dismissVC(false)
        }
        else {
            dismissVC()
        }
    }
    
    func layoutAllSubviews() {
        for subview in self.view.subviews {
            subview.layoutIfNeeded()
        }
    }
}

extension UIView {
    func addDashedLine(_ frameSize:CGSize, color: UIColor = COLORS.DEEP_SEA_BLUE) {
        let _ = layer.sublayers?.filter({ $0.name == "DashedTopLine" }).map({ $0.removeFromSuperlayer() })
        self.backgroundColor = UIColor.clear
        let cgColor = color.cgColor
        
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.name = "DashedTopLine"
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [3, 1]
        
        let path: CGMutablePath = CGMutablePath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: frameSize.width, y: 0))
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func findAndResignFirstResponder() -> Bool {
        if self.isFirstResponder {
            self.resignFirstResponder()
            return true
        }
        for subview in self.subviews {
            if subview.findAndResignFirstResponder() {
                return true
            }
        }
        return false
    }
    
    func findAndGetFirstResponder() -> AnyObject? {
        if self.isFirstResponder {
            return self
        }
        for subview in self.subviews {
            if let firstResponder = subview.findAndGetFirstResponder() {
                return firstResponder
            }
        }
        return nil
    }
    
    func layerViewRadius(radius: CGFloat){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
    }
    
    func addGreenShadow() {
        self.layer.shadowColor = COLORS.ORANGE_SHADOW.cgColor
        self.layer.shadowOpacity = 0.82
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 8
    }
    
    func addBlackShadow(_ color:CGColor = COLORS.BLACK_SHADOW.cgColor, offset:CGSize = CGSize(width: 0, height: 3), radius:CGFloat = 7) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
    
    func removeShadow() {
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 0
    }
    
    func removeAllSubviews() {
        var subs:[UIView] = []
        for subview in subviews {
            subs.append(subview)
        }
        for subview in subs {
            subview.removeFromSuperview()
        }
    }
    
    public class func fromNib(_ nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil, type: self)
    }
    
    public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil, type: T.self)
        return v!
    }
    
    public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = nibName
        }
        if let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) {
            for v in nibViews {
                if let tog = v as? T {
                    view = tog
                }
            }
        }
        
        return view
    }
    
    public class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
}

extension UITextField {
    func makeEmptyIfNil() {
        if self.text == nil {
            self.text = ""
        }
    }
    
    func trimWhiteSpaceAndNewLine() {
        self.text = self.text?.trimWhiteSpaceAndNewLine()
    }
}

extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
        }
        else {
            color.setFill()
            UIRectFill(rect)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension UINavigationBar {
    
    func hideBottomLine() {
        lineInNavigationBar(self)?.isHidden = true
    }
    
    func showBottomLine() {
        lineInNavigationBar(self)?.isHidden = false
    }
    
    fileprivate func lineInNavigationBar(_ view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
            return view as? UIImageView
        }
        
        for subview in view.subviews {
            if let imageView = lineInNavigationBar(subview) {
                return imageView
            }
        }
        
        return nil
    }
}

extension String {
    
    var length:Int {
        return self.count
    }
    
    func isNonEmpty() -> Bool {
        return self.isEmpty == false
    }
    
    func trimWhiteSpaceAndNewLine() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    mutating func trimLastComma() {
        trimLastCharacter(",")
    }
    
    mutating func trimLastCharacter(_ character:String) {
        if self.hasSuffix(character) {
            self = String(self.dropLast())
        }
    }
    
    mutating func getTrimmedLastComma() -> String {
        trimLastComma()
        return self
    }
    
    func trimEmptyParagraph() -> String {
        return self.replacingOccurrences(of: "<p> </p>", with: "", options: .caseInsensitive, range: nil)
    }
    
    func convertHTMLToAttributed(_ font:UIFont? = nil, color:UIColor? = nil) -> NSAttributedString? {
        let trimmedDesc = self.trimEmptyParagraph()
        if let data = trimmedDesc.data(using: String.Encoding.unicode) {
            do {
                let attrDesc = try NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
                if let attrFont = font {
                    attrDesc.addAttributes([NSAttributedString.Key.font:attrFont], range: NSMakeRange(0, attrDesc.length))
                }
                if let attrColor = color {
                    attrDesc.addAttributes([NSAttributedString.Key.foregroundColor:attrColor], range: NSMakeRange(0, attrDesc.length))
                }
                return attrDesc
            }
            catch _ {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    func convertI() -> String {
        return self.replacingOccurrences(of: "I", with: "İ")
    }
    
    func findRange(_ range:Range<Index>?, name:String, option:NSString.CompareOptions, locale:Locale?) -> Bool {
        if let _ = self.range(of: name, options: option, range: range, locale: locale) {
            return true
        }
        return false
    }
    
    func compare(_ text:String, range:Range<Index>?, locale:Locale = Locale(identifier: "tr")) -> Bool {
        return self.findRange(range, name: text, option: .caseInsensitive, locale: locale) ||
            self.findRange(range, name: text, option: .diacriticInsensitive, locale: locale) ||
            self.findRange(range, name: text, option: .widthInsensitive, locale: locale)
    }
    
    func compareAllAspects(_ text:String) -> Bool {
        let textFirst = text.uppercased()
        let textSecond = textFirst.convertI()
        if text == self {
            return true
        }
        else {
            let upperSelf = self.uppercased()
            if upperSelf == textFirst || upperSelf == textSecond {
                return true
            }
            else {
                let range = upperSelf.startIndex..<upperSelf.endIndex
                if upperSelf.compare(textFirst, range: range) || upperSelf.compare(textSecond, range: range) {
                    return true
                }
            }
        }
        return false
    }
    
    func containsUppercase(_ text:String) -> Bool {
        return self.contains(text) || self.contains(text.uppercased()) ||
            self.uppercased().contains(text) || self.contains(text.uppercased())
    }
    
    func containsAllAspects(_ text:String) -> Bool {
        if compareAllAspects(text) {
            return true
        }
        let convertedSelf = self.convertI()
        if self.containsUppercase(text) || convertedSelf.containsUppercase(text) {
            return true
        }
        let convertedText = text.convertI()
        if self.containsUppercase(convertedText) || convertedSelf.containsUppercase(convertedText) {
            return true
        }
        return false
    }
}

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func removeObject(_ object: Element) -> Int? {
        if let index = index(of: object) {
            remove(at: index)
            return index
        }
        return nil
    }
}

extension NSLayoutConstraint {
    
    func setMultiplier(_ multiplier:CGFloat) -> NSLayoutConstraint {
        
        if let fItem = firstItem {
            NSLayoutConstraint.deactivate([self])
            
            let newConstraint = NSLayoutConstraint(
                item: fItem,
                attribute: firstAttribute,
                relatedBy: relation,
                toItem: secondItem,
                attribute: secondAttribute,
                multiplier: multiplier,
                constant: constant)
            
            newConstraint.priority = priority
            newConstraint.shouldBeArchived = self.shouldBeArchived
            newConstraint.identifier = self.identifier
            
            NSLayoutConstraint.activate([newConstraint])
            return newConstraint
        }
        else {
            return self
        }
    }
}
