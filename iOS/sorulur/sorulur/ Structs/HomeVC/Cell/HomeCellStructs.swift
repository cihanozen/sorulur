//
//  HomeCellStructs.swift
//  sorulur
//
//  Created by Sinan Özman on 24.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

struct HomeCellStructs {
     weak var nickTextLabel: UILabel!
     weak var dateTextLabel: UILabel!
     weak var viewImage: UIView!
     weak var typeTextLabel: UILabel!
     weak var subjectTextLabel: UILabel!
     weak var textView: UIView!
     weak var title: UILabel!
     weak var contentImageView: UIImageView!
     weak var contentPrev: UILabel!
     weak var profileViewImage: UIView!
     weak var profileImageView: UIImageView!
}

extension HomeCellStructs {
    init(with view: TableViewCell) {
        self.nickTextLabel = view.nickTextLabel
        self.dateTextLabel = view.dateTextLabel
        self.viewImage = view.viewImage
        self.typeTextLabel = view.typeTextLabel
        self.subjectTextLabel = view.subjectTextLabel
        self.textView = view.textView
        self.title = view.title
        self.contentImageView = view.contentImageView
        self.contentPrev = view.contentPrev
        self.profileViewImage = view.profileViewImage
        self.profileImageView = view.profileImageView
    }
    
    mutating func reset() {
        self.nickTextLabel = nil
        self.dateTextLabel = nil
        self.viewImage = nil
        self.typeTextLabel = nil
        self.subjectTextLabel = nil
        self.textView = nil
        self.title = nil
        self.contentImageView = nil
        self.contentPrev = nil
        self.profileViewImage = nil
        self.profileImageView = nil
    }
}
