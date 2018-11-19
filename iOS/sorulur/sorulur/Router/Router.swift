//
//  Router.swift
//  sorulur
//
//  Created by Sinan Özman on 3.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

/// Router Class for control page navigations
class Router {
    /// ViewController Variable
    weak var delegate: UIViewController?
    
    /// İnit View Controller for delegate Variable
    ///
    /// - Parameter delegate: Root View Controller
    init(_ delegate: UIViewController){
        self.delegate = delegate
    }
    /// Deinit
    deinit {
        delegate = nil
    }
    
    /// Navigate selection page
    ///
    /// - Parameter page: Page enums
    public func navigation(_ page: Page){
        routing(page)
    }
    
    /// Dissmiss present ViewController
    public func dismiss(){
        self.delegate?.dismiss(animated: true, completion: nil)
    }
    
    /// private Routing function
    ///
    /// - Parameter page: Page Enums
    private func routing(_ page: Page){
        switch page {
        case .Signup:
            navigate(identifier: .SIGNUPID)
        case .Navigation:
            navigate(identifier: .NAVIGATION)
        default:
            break
        }
    }
    
    /// Private Navigate Selection page with identifier
    ///
    /// - Parameter identifier: identifier
    private func navigate(identifier: StoryboardIdentifier){
        DispatchQueue.main.async {
            let newViewController = self.delegate!.storyboard?.instantiateViewController(withIdentifier: identifier.rawValue)
            self.delegate!.present(newViewController!, animated: true, completion: nil)
        }
    }

}


/// Router interface
protocol router {
    func navigate(_ page: Page)
    func dissmiss()
}

// MARK: - UIViewController
extension router where Self: UIViewController {
    /// Navigate page function
    ///
    /// - Parameter page: selection navigate page
    func navigate(_ page: Page){
        let router = Router(self)
        router.navigation(page)
    }
    
    /// Dissmiss present
    func dissmiss(){
        self.dissmiss()
    }
}

/// Pages
///
/// - Login: LoginVC Page
/// - Signup: SignupVC Page
public enum Page {
    case Login
    case Signup
    case Navigation
}
