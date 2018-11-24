//
//  HomeVC.swift
//  sorulur
//
//  Created by Sinan Özman on 19.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire



class HomeVC: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    var data: (AllQuestion)?
    
    var param: HomeVCStructs {
        print("Login VC Struct")
        return HomeVCStructs(with: self)
    }
    
    var shownIndexes : [IndexPath] = []
}

extension HomeVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSetup()
        setup()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeVC {
    override func backAction() {
        print("ok")
    }
    
    override func rightAction() {
        print("right")
    }
    
    override func leftAction() {
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "openLeftView"), object: nil)
    }
}

extension HomeVC: HomeControllerDelegate {
    func dataSetup(){
        getAllQuestion()
        print(self.data?.count , color: .red)
        print(self.data?[9].cinsiyet , color: .red)
    }
}

extension HomeVC: BaseNCDelegate {    
    func setup() {
        config(color: COLORS.NAV_PURPLE, style: .default, trans: false)
        addTitle(text: "Sorulur")
        addButton(type: .left, color: UIColor.blue , image: UIImage(named: "ic_menu"))
        addButton(type: .right, color: UIColor.red, image: UIImage(named: "ic_dot"))
    }
}


extension HomeVC: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return (data?.count ?? 20)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.HOMECELL.rawValue) as! TableViewCell
        if data != nil {
            let _data = data?[indexPath.row]
            cell.loadingAnimation(false)
            cell.setBorderColor((_data?.cinsiyet)!)
            cell.nickTextLabel.text = _data?.yaziEkleyenKadi
            cell.setNickColor((_data?.cinsiyet)!)
            cell.dateTextLabel.text = _data?.yaziTarih
            cell.title.text = _data?.yaziBaslik
            cell.typeTextLabel.text = _data?.neYazdi
            cell.subjectTextLabel.text = _data?.katAdi
            cell.contentPrev.text = _data?.yaziIcerik
            cell.setContentImage(_data?.soruResim ?? "")
            print("üye avatat \(_data?.uyeAvatar)")
            cell.setProfileImage(_data?.uyeAvatar ?? "", gender: (_data?.cinsiyet)!)
        } else {
            cell.loadingAnimation(true)
        }
        return cell
    }
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(data?[indexPath.row].soruResim, color: .orange)
        if let _: String = data?[indexPath.row].cinsiyet {
            if data?[indexPath.row].soruResim != nil {
                return 400
            } else {
                return 200
            }
        } else {
            return 400
        }
    }
}


extension UITableView {
    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.0, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
