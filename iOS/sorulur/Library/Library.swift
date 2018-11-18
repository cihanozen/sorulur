//
//  Library.swift
//  Yenibiris
//
//  Created by Mustafa Yusuf on 29.08.2015.
//  Copyright © 2015 Yenibiris. All rights reserved.
//

import UIKit
import SnapKit

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}


enum TIME_GAPS {
    case morning
    case afternoon
    case evening
    case night
}

func isVersionBiggerThan(_ version:Float) -> Bool {
    if let ver = Float(UIDevice.current.systemVersion) {
        return ver >= version
    }
    else {
        if ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: Int(version), minorVersion: 0, patchVersion: 0)) {
            return true
        }
        return false
    }
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

func screenHeight() -> CGFloat {
    return UIScreen.main.bounds.size.height
}

func screenWidth() -> CGFloat {
    return UIScreen.main.bounds.size.width
}

func isSmallerScreen() -> Bool {
    return screenWidth() <= 320
}

func hideEmptyCells(_ table:UITableView) {
    table.tableFooterView = UIView()
}

func lockScreen() {
    if UIApplication.shared.isIgnoringInteractionEvents == false {
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
}

func unlockScreen() {
    if UIApplication.shared.isIgnoringInteractionEvents == true {
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}

func canOpenURL(_ url:URL) -> Bool {
    return UIApplication.shared.canOpenURL(url)
}

func openURL(_ url:URL) {
    if canOpenURL(url) {
        UIApplication.shared.openURL(url)
    }
}

//func findCityModel(_ name:String, from:[LookupModel]) -> LookupModel? {
//    for city in from {
//        if city.name.compareAllAspects(name) {
//            return city
//        }
//    }
//    return nil
//}
//
//func getFilterText(_ request:SearchRequest) -> (String,Int) {
//    //TODO: Make localized
//    var filterText = ""
//    var filterCount = 0
//    if request.recencyOption != .none {
//        filterText += "İlan Tarihi,"
//        filterCount = filterCount + 1
//    }
//    if request.positions.count > 0 {
//        filterText += "Pozisyon Adı,"
//        filterCount = filterCount + 1
//    }
//    if request.cities.count > 0 {
//        filterText += "Lokasyon,"
//        filterCount = filterCount + 1
//    }
//    if request.sectors.count > 0 {
//        filterText += "Sektör,"
//        filterCount = filterCount + 1
//    }
//    if request.jobCategoryList.count > 0 {
//        filterText += "İlan,"
//        filterCount = filterCount + 1
//    }
//    if request.positionLevels.count > 0 {
//        filterText += "Pozisyon Seviyesi,"
//        filterCount = filterCount + 1
//    }
//    if request.workingTypes.count > 0 {
//        filterText += "Çalışma Şekli,"
//        filterCount = filterCount + 1
//    }
//    filterText.trimLastComma()
//    return (filterText,filterCount)
//}

func createLabel(_ text:String? = nil, textColor:UIColor = UIColor.white, textAlignment:NSTextAlignment = NSTextAlignment.left) -> UILabel {
    let label = UILabel()
//    label.font = font
    label.textColor = textColor
    label.text = text
    label.textAlignment = textAlignment
    label.sizeToFit()
    return label
}

//func getDataRow(_ source:[AnyObject]?, indexPath:IndexPath) -> AnyObject? {
//    let row = indexPath.row
//    if row >= 0 && row < source?.count {
//        return source?[row]
//    }
//    else {
//        return nil
//    }
//}
//
//func getSelectedCell(_ table:UITableView, indexPath:IndexPath) -> BaseTableCell? {
//    var selectedCell:BaseTableCell?
//    for cell in table.visibleCells {
//        if let baseCell = cell as? BaseTableCell {
//            if let index = baseCell.indexPath {
//                if index.section == indexPath.section && index.row == indexPath.row {
//                    selectedCell = baseCell
//                    break
//                }
//            }
//        }
//    }
//    return selectedCell
//}
//
//func sortLookups(_ list:[LookupModel]) -> [LookupModel] {
//    return list.sorted {
//        if $0.orderNo == $1.orderNo {
//            return $0.name < $1.name
//        }
//        else {
//            return $0.orderNo < $1.orderNo
//        }
//    }
//}

//func matchAdsIn(_ ad:AdvertisementBaseModel, controllers:[UIViewController], isForFavourite:Bool, exceptVC:UIViewController) {
//    for vc in controllers {
//        if vc == exceptVC && !(vc is PagingBaseVC) {
//            continue
//        }
//        if let listVC = vc as? AdvertisementListVC {
//            listVC.matchRelatedAd(ad, isForFavourite: isForFavourite)
//        }
//        else if let detailVC = vc as? AdvertisementDetailVC {
//            detailVC.matchRelatedAd(ad, isForFavourite: isForFavourite)
//        }
//        else if let appsVC = vc as? ApplicationsVC {
//            appsVC.matchRelatedAd(ad, isForFavourite: isForFavourite)
//        }
//        else if let pageVC = vc as? PagingBaseVC {
//            pageVC.matchRelatedAd(ad, isForFavourite: isForFavourite)
//        }
//    }
//}

//func matchAds(_ ad:AdvertisementBaseModel, inVC:UIViewController, isForFavourite:Bool = false) {
//    if isForFavourite {
//        ad.isFavoriteByUser = !ad.isFavoriteByUser
//    }
//    else {
//        ad.isViewedByUser = true
//    }
//    if let tabbarControllers = inVC.tabBarController?.viewControllers {
//        for navVC in tabbarControllers {
//            if let viewControllers = (navVC as? UINavigationController)?.viewControllers {
//                matchAdsIn(ad, controllers: viewControllers, isForFavourite: isForFavourite, exceptVC: inVC)
//            }
//        }
//    }
//    else if let viewControllers = inVC.navigationController?.viewControllers {
//        matchAdsIn(ad, controllers: viewControllers, isForFavourite: isForFavourite, exceptVC: inVC)
//    }
//}

class Library: NSObject {
    
//    static func currentUsersUserId() -> String? {
//        if let userId = YBSingleton.sharedInstance.currentUser?.userID {
//            return "\(userId)"
//        }
//        else {
//            return nil
//        }
//    }
    
    static func getWiFiAddress() -> String? {
        var address : String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            
            // For each interface ...
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                
                // Check for IPv4 or IPv6 interface:
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    // Check interface name:
                    if let name = String(validatingUTF8: (interface?.ifa_name)!), name == "en0" {
                        
                        // Convert interface address to a human readable string:
                        var addr = interface?.ifa_addr.pointee
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if addr != nil, let len = interface?.ifa_addr.pointee.sa_len {
                            getnameinfo(&addr!, socklen_t(len),
                                        &hostname, socklen_t(hostname.count),
                                        nil, socklen_t(0), NI_NUMERICHOST)
                        }
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        
        return address
    }
}
