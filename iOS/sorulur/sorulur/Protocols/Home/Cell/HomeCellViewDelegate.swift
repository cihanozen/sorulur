//
//  HomeCellViewDelegate.swift
//  sorulur
//
//  Created by Sinan Özman on 24.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCellViewDelegate {
    func roundedProfileImage(_ size: CGFloat)
}

extension HomeCellViewDelegate where Self: TableViewCell {
    var view: HomeCellView {
        return HomeCellView(param)
    }
    
    func roundedProfileImage(_ size: CGFloat = 27){
//        LeftMenuView(view: self.imageView).viewEditCornerRadius(30, true)
            view.profileImageCornerRadius(size, true)

    }
}
