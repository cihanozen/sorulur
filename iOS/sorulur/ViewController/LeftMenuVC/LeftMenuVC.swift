//
//  LeftMenuVC.swift
//  sorulur
//
//  Created by Sinan Özman on 5.11.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuVC: UIViewController, LeftMenuDelegate {
    var isOpenLeftMenu: Bool = false
    @IBOutlet weak var leftMenuCons: NSLayoutConstraint!
    @IBOutlet weak var leftMenuView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let open: Selector = #selector(openLeftView)
    let close: Selector = #selector(closeLeftView)
    let pan: Selector = #selector(panChangePosition)
    let openName = NSNotification.Name(rawValue: "openLeftView")
    let closeName = NSNotification.Name(rawValue: "closeLeftView")
    let panName = NSNotification.Name(rawValue: "panChangePosition")
    
    var param: LeftMenuVCStructs {
        print("Login VC Struct")
        return LeftMenuVCStructs(with: self) ?? LeftMenuVCStructs()
    }
    
    private var data: [String] = []
}

extension LeftMenuVC: LeftMenuViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: open, name: openName, object: nil)
        NotificationCenter.default.addObserver(self, selector: close, name: closeName, object: nil)
        NotificationCenter.default.addObserver(self, selector: pan, name: panName, object: nil)
        tableView.dataSource = self
        tableView.delegate = self
        #warning("DEBUG")
        for index in 0 ... 1000 {
            data.append("\(index)")
        }
        setupUI()
        roundedProfileImage()
        dataSetup()
    }
}

extension LeftMenuVC: LeftMenuControllerDelegate {
    @IBAction func closeLeftMenu(){
        closeLeftView()
    }
    
    @objc func openLeftView(){
        openLeftViewProtocol()
    }
    
    @objc func closeLeftView(){
        closeLeftViewProtocol()
    }
    
    @objc func panChangePosition(_ notification: Notification?){
        panChangePositionProtocol(notification)
    }
    
    func dataSetup(){
        setProfileImage()
        setName()
        setLevel()
    }
}

extension LeftMenuVC: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.row == 1 ? StoryboardIdentifier.LEFTMENUTABLECELLTYPE2.rawValue : StoryboardIdentifier.LEFTMENUTABLECELLTYPE1.rawValue)!
        return cell
    }
}

extension LeftMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 1 ? 120 : 60
    }
}
