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
    static let PurpleColor = UIColor(red: 90/255, green: 20/255, blue: 105/255, alpha: 1.0)
    static let LightPinkColor = UIColor(red: 240/255, green: 165/255, blue: 165/255, alpha: 1.0)
    static let MidPurpleColor = UIColor(red: 208/255, green: 102/255, blue: 155/255, alpha: 1.0)
    static let GoldenPinkColor = UIColor(red: 1.0, green: 177/255, blue: 151/255, alpha: 1.0)
    static let GoldenOrangeColor = UIColor(red: 1.0, green: 192/255, blue: 88/255, alpha: 1.0)
    static let GoldenYellowLight = UIColor(red: 1.0, green: 206/255, blue: 164/255, alpha: 1.0)
    
    static let VagueWhiteColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
    static let RoundedRectOnColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
}


struct LiveVariables {
    static var shared = LiveVariables()
    
    let defaultCornerRadius : CGFloat = 8
    
    
    //MARK:- Device Family
    var isiPhoneXFamily: Bool {
        return isIphoneXFamilyOrLater()
    }
    private func returniPhoneModel() -> DeviceModel {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case ..<1136:
                return .iphone4
            case 1136:
                return .iphone5_5s_5c
            case 1334:
                return .iphone6_6s_7_8
            case 1920, 2208:
                return .iphone6Plus_6sPlus_7Plus_8Plus
            case 2436:
                return .iphoneX_XS
            case 2688:
                return .iphoneXsMax
            case 1792:
                return .iphoneXR
            default:
                print("Unknown - probably later models")
                return .later
            }
        } else if UIDevice().userInterfaceIdiom == .pad {
            return .iPad
        }
        return .unknown
    }
    private func isIphoneXFamilyOrLater() -> Bool {
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
