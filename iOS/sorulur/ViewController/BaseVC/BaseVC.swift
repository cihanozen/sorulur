//
//  BaseVC.swift
//  Yenibiris
//
//  Created by Barış Özer on 10/20/16.
//  Copyright © 2016 Yenibiris. All rights reserved.
//

import UIKit

enum NAVIGATIONBARTYPE {
    case main
    case nothing//Hide navigationbar, hide tabbar
    case tabbar//Hide navigationbar, show tabbar
    case simple//Show navigationbar, show tabbar, No Left/Right item just title
    case back//Show navigationbar, show tabbar, Custom back & title
    case back_NO_TAB//Show navigationbar, hide tabbar, Custom back & title
    case login//Show navigationbar, hide tabbar, Custom back & title & right bar item with text
    case register//Show navigationbar, hide tabbar, Custom back & title & right bar item with text
    case filter//Custom back & title & right bar item with text
    case search//Show navigationbar, hide tabbar, Custom back & logo
    case ad_LIST//Custom back & title view & filter view
    case ad_DETAIL//Custom back & title view & right bar item with text
    case ad_REPORT//Left bar item with text & right bar item with text
    case apply_START//Custom back & title
    case apply_UPDATE//Custom back & title & right bar item with text
    case profile//Title & right bar item with text
    case reach_US//Custom back & title & right bar item with text
}

class BaseVC: UIViewController {
    
    var navBarType:NAVIGATIONBARTYPE? {
        didSet {
            customizeNavBar()
        }
    }
    var isTabbarHidden:Bool = false
    var computedViewHeight:CGFloat {
        get {
            return screenHeight() - DEFAULT_NAVBAR_STATUS_SIZE - DEFAULT_TABBAR_SIZE
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = COLORS.WHITE_BG
        customizeNavBar()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    //MARK: Self Methods. Can be overrided.
    func isLayoutBroken() -> Bool {
        return false
    }
    
    func setupUI() {
        
    }
    
    func adjustUI(_ animated: Bool) {
        
    }
    
    func enablePopGesture(_ willEnable:Bool = true) {
        if let navCon = self.navigationController as? BaseNC {
            navCon.isPopGestureEnabled = willEnable
        }
    }
    
    func addShadowToNavBar() {
        self.navigationController?.navigationBar.addBlackShadow()
    }
    
    func removeShadowFromNavBar() {
        self.navigationController?.navigationBar.removeShadow()
    }
    
    func setTranslucent(){
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
//    func shareAd(_ ad:AdvertisementModel, fromVC:UIViewController) {
//        if let shareUrl = ad.shareUrl, let url = URL(string: shareUrl) {
//            let title = ad.title ?? "Bu ilana göz atmalısın"
//            let objectsToShare = [title, url] as [Any]
//            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//            activityVC.completionWithItemsHandler = { (activityType, completed, items, error) in
//                UIViewController.adjustNavBar()
//            }
//            fromVC.presentVC(activityVC) {
//                UIViewController.resetNavBar()
//            }
//        }
//    }
    
    //MARK: Private Methods
    fileprivate func customizeNavBar() {
        if let navVC = self.navigationController, let type = navBarType {
            switch type {
            case .nothing:
                hideNavBar()
                hideTabBar()
                addGradientNavigation()
            case .tabbar:
                hideNavBar()
                hideTabBar(false)
                addGradientNavigation()
            case .simple:
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.leftBarButtonItems = nil
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
                hideNavBar(false)
                hideTabBar(false)
                addGradientNavigation()
            case .back:
                addCustomBack()
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
                hideNavBar(false)
                hideTabBar(false)
                addGradientNavigation()
            case .back_NO_TAB:
                addCustomBack()
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
                hideNavBar(false)
                hideTabBar()
                addGradientNavigation()
            case .login, .register, .filter, .apply_START, .apply_UPDATE, .reach_US:
                addCustomBack()
                switch type {
                case .login:
                    addBarButton(TEXT_KEY_SIGN_UP_SMALL)
                case .register:
                    addBarButton(TEXT_KEY_LOGIN_EMAIL_LOGIN_SMALL)
                case .filter:
                    addBarButton(TEXT_KEY_CLEAR)
                case .apply_UPDATE:
                    addBarButton(TEXT_KEY_WITHDRAW)
                case .reach_US:
                    addBarButton(TEXT_KEY_DELETE)
                default:
                    break
                }
                hideNavBar(false)
                hideTabBar()
                addGradientNavigation()
            case .search:
                addCustomBack()
                addLogo()
                hideNavBar(false)
                hideTabBar()
                addGradientNavigation()
            case .ad_LIST:
                addCustomBack()
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
                hideNavBar(false)
                hideTabBar(false)
                addGradientNavigation()
            case .ad_DETAIL:
                addCustomBack()
                //addBarButton(TEXT_KEY_SHARE)
                hideNavBar(false)
                hideTabBar()
                addGradientNavigation()
                setTranslucent()
            case .ad_REPORT:
                addBarButton(TEXT_KEY_DELETE)
                addBarButton(TEXT_KEY_ABORT, isLeft: true)
                hideNavBar(false)
                addGradientNavigation()
            case .profile:
                hideNavBar(false)
                hideTabBar(false)
                addRightIcon("icSettingsWhite")
                addGradientNavigation()
            case .main:
//                addBarButton("Menü", color: UIColor.black, isLeft: true)
//                addBarButton("3dot", color: UIColor.black)
//                hideNavBar(false)
//                hideTabBar()
//                addGradientNavigation()
//                addLogo()
//                setTranslucent()
                addCustomBack()
                addLogo()
                hideNavBar(false)
                hideTabBar()
                addGradientNavigation()
            }
            navVC.navigationBar.addBlackShadow()
        }
    }
    
    fileprivate func hideNavBar(_ willHide:Bool = true, animated:Bool = true) {
        self.navigationController?.setNavigationBarHidden(willHide, animated: animated)
        enablePopGesture(!willHide)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    fileprivate func hideTabBar(_ willHide:Bool = true) {
        self.tabBarController?.tabBar.isHidden = willHide
        isTabbarHidden = willHide
    }
    
    fileprivate func addGradientNavigation(_ willHide:Bool = true) {
        navigationController?.navigationBar.setGradientBackground()
    }
    
    fileprivate func addLogo() {
        if let _ = self.navigationController {
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo-white"))
        }
    }
    
    fileprivate func addCustomBack() {
        if let _ = self.navigationController, let image = UIImage(named: "ic_back") {
            let buttonBack = UIButton(type: .custom)
            buttonBack.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
            buttonBack.setBackgroundImage(image, for: UIControl.State())
            buttonBack.setTitle(nil, for: UIControl.State())
            buttonBack.addTarget(self, action: #selector(BaseVC.customBack), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonBack)
        }
    }
    
    fileprivate func addRightIcon(_ imageName:String) {
        if let _ = self.navigationController, let image = UIImage(named: imageName) {
            let buttonRight = UIButton(type: .custom)
            buttonRight.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
            buttonRight.setBackgroundImage(image, for: UIControl.State())
            buttonRight.setTitle(nil, for: UIControl.State())
            buttonRight.addTarget(self, action: #selector(BaseVC.rightBarButtonPressed), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
        }
    }
    
    func addBarButton(_ title:String, color:UIColor = UIColor.white, isLeft:Bool = false) {
        if let _ = self.navigationController {
            let button = UIButton(type: .custom)
            button.setTitle(title, for: UIControl.State())
            button.setTitleColor(color, for: UIControl.State())
            button.sizeToFit()
            if isLeft {
                button.addTarget(self, action: #selector(BaseVC.leftBarButtonPressed), for: .touchUpInside)
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            }
            else {
                button.addTarget(self, action: #selector(BaseVC.rightBarButtonPressed), for: .touchUpInside)
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
            }
        }
    }
    
    //MARK: Actions. Can be overrided.
    @objc func customBack() {
        if let navCon = self.navigationController {
            if let firstVC = navCon.viewControllers.first {
                if firstVC == self {
                    resignAndDismissLikePush()
                    return
                }
            }
            resignAndPop()
        }
        else {
            resignAndDismissLikePush()
        }
    }
    
    @objc func rightBarButtonPressed() {
        
    }
    
    @objc func leftBarButtonPressed() {
        
    }
    
    //MARK: Email TextField Delegate
    @objc func emailFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        if Validator.isEmailValid(text) {
            textField.rightView = UIImageView(image: UIImage(named: "ic_tick_green"))
            textField.rightViewMode = .always
            textField.textColor = COLORS.GREEN
        }
        else {
            textField.rightView = nil
            textField.rightViewMode = .never
            textField.textColor = COLORS.BLACK
        }
    }
}

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint.zero
        endPoint = CGPoint(x: 0, y: 0)
    }
    
    func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
}

extension UINavigationBar {
    
    func setGradientBackground() {
        var colors = [UIColor]()
        colors.append(UIColor(red: 39.0/255.0, green: 77.0/255.0, blue: 158.0/255.0, alpha: 1.0))
        colors.append(UIColor(red: 102.0/255.0, green: 70.0/255.0, blue: 156.0/255.0, alpha: 1.0))
        
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
