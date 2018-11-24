//
//  TabbarVC.swift
//  sorulur
//
//  Created by Sinan Özman on 5.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

class TabbarVC: UIViewController {
    @IBOutlet var leftView: UIView!
}

extension TabbarVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Left Menu Functions
        hiddenLeftMenu()
        let show: Selector = #selector(showLeftMenu)
        let hide: Selector = #selector(hiddenLeftMenu)
        let showName = NSNotification.Name(rawValue: "showLeftMenu")
        let hideName = NSNotification.Name(rawValue: "hiddenLeftMenu")
        NotificationCenter.default.addObserver(self, selector: show, name: showName, object: nil)
        NotificationCenter.default.addObserver(self, selector: hide, name: hideName, object: nil)
    }
}

extension TabbarVC {
    @IBAction func swipeLeftMenu(_ sender: UIScreenEdgePanGestureRecognizer){
        let recognizer = "UIPanGestureRecognizer"
        let state = "UIPanGestureRecognizerState"
        let recognizerValue = abs(sender.translation(in: view).x)
        let vcs = [recognizer: recognizerValue, state: sender.state.rawValue] as [String: Any]
        let name = NSNotification.Name(rawValue: "panChangePosition")
        print(vcs)
        NotificationCenter.default.post(name: name, object: sender, userInfo: vcs)
    }
    
    @objc func hiddenLeftMenu(){
          self.leftView.isHidden = true
    }
    
    @objc func showLeftMenu(){
          self.leftView.isHidden = false
    }
}
