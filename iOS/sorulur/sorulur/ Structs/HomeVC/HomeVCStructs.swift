//
//  HomeVCStructs.swift
//  sorulur
//
//  Created by Sinan Özman on 24.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

struct HomeVCStructs {
    var data: AllQuestion?
}

extension HomeVCStructs {
    init(with view: HomeVC) {
        self.data = view.data
    }
    
    mutating func reset() {
        self.data = nil
    }
}
