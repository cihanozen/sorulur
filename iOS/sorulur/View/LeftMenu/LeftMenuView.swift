//
//  LeftMenuView.swift
//  sorulur
//
//  Created by Sinan Özman on 7.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuView {
    var view: UIView?
    var cons: NSLayoutConstraint?
    var option: UIView.KeyframeAnimationOptions = .calculationModeLinear
    var param: LeftMenuVCStructs?
    
    init(_ view: UIView, _ cons: NSLayoutConstraint) {
        //        log.info(message: "inits")
        //        log.info(message: "view init")
        self.view = view
        //        log.info(message: "cons init")
        self.cons = cons
    }
    
    init(view: UIView) {
        //        log.info(message: "inits")
        //        log.info(message: "view init")
        self.view = view
    }
    
    init(_ param: LeftMenuVCStructs) {
        log.debug("SignUp View İnit")
        self.param = param
    }
    
    deinit {
        //        log.info(message: "deinit")
        self.view = nil
        self.cons = nil
    }
    
    func animationLeftView(duration: Double, delay: Double, cons: CGFloat, status: Bool = false) {
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: option, animations: { () -> Void in
            self.cons?.constant = cons
            self.view?.layoutIfNeeded()
        }, completion: { (_: Bool) -> Void in
            if status {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "hiddenLeftMenu"), object: nil)
            }
        })
    }
    
    func leftMenuAnimation(cons: CGFloat, state: Int, isOpenLeftMenu: Bool) -> Bool {
        var status: Bool = false
        if isOpenLeftMenu == false {
            if state != 3 {
                if cons <= 210 {
                    UIView.animateKeyframes(withDuration: 0.0, delay: 0.0, options: option, animations: { () -> Void in
                        self.cons?.constant = (-212 + cons)
                        self.view?.layoutIfNeeded()
                    }, completion: { (_: Bool) -> Void in })
                } else {
                    self.cons?.constant = 0
                    view?.layoutIfNeeded()
                }
            } else {
                if cons > (212 / 4) {
                    status = true
                    UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: option, animations: { () -> Void in
                        self.cons?.constant = 0
                        self.view?.layoutIfNeeded()
                    }, completion: { (_: Bool) -> Void in })
                } else {
                    UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: option, animations: { () -> Void in
                        self.cons?.constant = -212
                        self.view?.layoutIfNeeded()
                    }, completion: { (_: Bool) -> Void in
                        let name = NSNotification.Name(rawValue: "hiddenLeftMenu")
                        NotificationCenter.default.post(name: name, object: nil)
                    })
                }
            }
        }
        return status
    }
    
    // MARK: View Effects for corner radius
    
    public func viewEditCornerRadius(_ cradius: CGFloat, _ clipToBounds: Bool) {
        //        log.info(message: "view edit")
        let getView = view
        getView?.clipsToBounds = clipToBounds
        getView?.layer.cornerRadius = cradius
    }
    
    // MARK: View Effect for shadow
    
    public func viewEditShadows(_ sColor: UIColor,
                                _ width: CGFloat,
                                _ height: CGFloat,
                                _ sradius: CGFloat,
                                _ opacity: Float) {
        //        log.info(message: "")
        let getView = view
        getView?.layer.shadowColor = sColor.cgColor
        getView?.layer.shadowOffset.width = width
        getView?.layer.shadowOffset.height = height
        getView?.layer.shadowRadius = sradius
        getView?.layer.shadowOpacity = opacity
    }
    
    public func setProfileImage(_ image: UIImage){
        param?.profileImageView?.image = image
    }
}

