//
//  HomeControllerDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 22.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol HomeControllerDelegate {
    func getAllQuestion()
}

extension HomeControllerDelegate where Self: HomeVC {
    var homeController: HomeController {
        print("Home Controller")
        return HomeController(param)
    }
    
    func getAllQuestion() {
        homeController.allQuestion { (response) in
            print("response : \(response[0].cinsiyet)")
            self.data = response
            self.tableView.reloadWithAnimation()
//            self.tableView.reloadData()
        }
    }
}
