//
//  HomeVC.swift
//  sorulur
//
//  Created by Sinan Özman on 19.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: BaseVC {
    
    
}

extension HomeVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeVC {
    override func backAction() {
        print("ok")
    }
}

extension HomeVC: BaseNCDelegate {
    func setup() {
        addTitle()
        addBack()
    }
}
