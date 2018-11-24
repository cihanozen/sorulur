//
//  TableViewCell.swift
//  sorulur
//
//  Created by Sinan Özman on 24.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import UIKit
import SkeletonView
import SDWebImage
import SnapKit

class TableViewCell: UITableViewCell {
    var animation: Bool?
    @IBOutlet weak var nickTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var typeTextLabel: UILabel!
    @IBOutlet weak var subjectTextLabel: UILabel!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentPrev: UILabel!
    @IBOutlet weak var profileViewImage: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var borderLine: UIView!
    var variables: [Optional<UIView>]?
    
    var param: HomeCellStructs {
        print("Home Cell Struct")
        return HomeCellStructs(with: self)
    }
  

     func loadingAnimation( _ animation: Bool) {
            self.nickTextLabel.setAnimation(animation)
            self.dateTextLabel.setAnimation(animation)
            self.viewImage.setAnimation(animation)
            self.typeTextLabel.setAnimation(animation)
            self.subjectTextLabel.setAnimation(animation)
            self.textView.setAnimation(animation)
            self.title.setAnimation(animation)
            self.contentImageView.setAnimation(true)
            self.profileViewImage.setAnimation(true)
            self.contentPrev.setAnimation(animation)
    }
    
    func setNickColor(_ gender: String) {
        switch gender {
        case "K":
            self.nickTextLabel.textColor = COLORS.FEMALE
        case "E":
            self.nickTextLabel.textColor = COLORS.MALE
        default:
            return
        }
    }
    
    func setBorderColor(_ gender: String) {
        switch gender {
        case "K":
            self.borderLine.backgroundColor = COLORS.FEMALE
        case "E":
            self.borderLine.backgroundColor = COLORS.MALE
        default:
            return
        }
    }
    
    func setProfileImage(_ image: String , gender: String) {
        if image != "" {
            DispatchQueue.main.async {
                self.profileImageView?.sd_setImage(with: URL(string: image)) { _ , _ , _, _ in
                    self.profileViewImage.setAnimation(false)
                }
            }
        } else {
            self.profileViewImage.setAnimation(false)
            self.profileImageView.image = nil
        }
        switch gender {
        case "K":
            self.profileViewImage.layer.borderWidth = 2
            self.profileViewImage.layer.borderColor = COLORS.FEMALE.cgColor
        case "E":
            self.profileViewImage.layer.borderWidth = 2
            self.profileViewImage.layer.borderColor = COLORS.MALE.cgColor
        default:
            return
        }
    }
    
    func setContentImage(_ image: String) {
//        self.contentImageView.profileImageView?.sd_setImage(with: URL(string: image) , completion:)
        if image != "" {
            self.contentImageView?.sd_setImage(with: URL(string: image)) { _ , _ , _, _ in
                self.contentImageView.setAnimation(false)
            }
        } else {
            self.contentImageView.setAnimation(false)
            self.contentImageView.image = nil
//            self.contentImageView.snp.makeConstraints ({ (make) in
//                make.height.equalTo(0)
//            })

        }
    }
}

extension UIView {
    fileprivate func setAnimation(_ animation: Bool) {
        if animation {
            self.isSkeletonable = animation
            self.showAnimatedSkeleton()
        } else {
            self.isSkeletonable = animation
            self.stopSkeletonAnimation()
            self.hideSkeleton()
        }
    }
}

extension TableViewCell: HomeCellViewDelegate {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundedProfileImage()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
