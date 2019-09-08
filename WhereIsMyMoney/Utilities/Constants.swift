//
//  Constants.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/7/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit




extension UIColor {
    static let TabBarFillColor = UIColor(red: 248/255, green: 207/255, blue: 200/255, alpha: 0.8)
    static let TabBarShadowColor = UIColor(red: 235/255, green: 183/255, blue: 175/255, alpha: 1.0)
    static let TabBarItemUnselectedColor = UIColor(red: 220/255, green: 137/255, blue: 158/255, alpha: 1.0)
}


struct LiveVariables {
    
    
    
    
    
    //MARK:- Device Family
    static var isiPhoneXFamily: Bool {
        return isIphoneXFamilyOrLater()
    }
    static func returniPhoneModel() -> DeviceModel {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case ..<1136:
                return .iphone4
            case 1136:
                print("iPhone 5 or 5S or 5C")
                return .iphone5_5s_5c
            case 1334:
                print("iPhone 6/6S/7/8")
                return .iphone6_6s_7_8
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                return .iphone6Plus_6sPlus_7Plus_8Plus
            case 2436:
                print("iPhone X, XS")
                return .iphoneX_XS
            case 2688:
                print("iPhone XS Max")
                return .iphoneXsMax
            case 1792:
                print("iPhone XR")
                return .iphoneXR
            default:
                print("Unknown - probably later")
                return .later
            }
        } else if UIDevice().userInterfaceIdiom == .pad {
            return .iPad
        }
        return .unknown
    }
    static func isIphoneXFamilyOrLater() -> Bool {
        if returniPhoneModel() == .iphoneX_XS ||
           returniPhoneModel() == .iphoneXsMax ||
           returniPhoneModel() == .iphoneXR ||
           returniPhoneModel() == .later {
            return true
        }
        return false
    }

    enum DeviceModel {
        case iphone4
        case iphone5_5s_5c
        case iphone6_6s_7_8
        case iphone6Plus_6sPlus_7Plus_8Plus
        case iphoneX_XS
        case iphoneXsMax
        case iphoneXR
        case later
        
        case iPad
        
        case unknown
    }
}
