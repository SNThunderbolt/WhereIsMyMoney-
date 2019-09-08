//
//  CustomizationsonTabbarControllerView.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/8/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit


struct CustomTabBarItemImages {
    static var shared = CustomTabBarItemImages()
    
    
    
    private let firstItemImage = UIImage(named: "dashboardIocn")
    private let firstItemSelectedImage = UIImage(named: "dashboardIocnSelected")
    private let firstItemImageInsets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 22, left: 10, bottom: -21, right: -10) : UIEdgeInsets(top: 10, left: 10, bottom: -9, right: -10)
    
    private let secondItemImage = UIImage(named: "calendarIcon")
    private let secondItemSelectedImage = UIImage(named: "calendarIconSelected")
    private let secondItemImageInsets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0) : UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
    
    private let thirdItemImage = UIImage(named: "profileIcon")
    private let thirdItemSelectedImage = UIImage(named: "profileIconSelected")
    private let thirdItemImageInsets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 20, left: -10, bottom: -20, right: 10) : UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
    
    private let forthItemImage = UIImage(named: "addBtn")
    private let forthItemSelectedImage = UIImage(named: "addBtnSelected")
    private let forthItemImageInsets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 8, left: -1, bottom: -8, right: 6) : UIEdgeInsets(top: -10, left: -3, bottom: 10, right: 8)
    
    
    typealias CustomTabbarItemImageTuple = (defaultImage: UIImage, selectedImage: UIImage, imageInsets: UIEdgeInsets)
    
    let customItems : [CustomTabbarItemImageTuple]!
    
    init() {
        firstItemImage?.withRenderingMode(.alwaysOriginal)
        firstItemSelectedImage?.withRenderingMode(.alwaysOriginal)
        
        secondItemImage?.withRenderingMode(.alwaysOriginal)
        secondItemSelectedImage?.withRenderingMode(.alwaysOriginal)
        
        thirdItemImage?.withRenderingMode(.alwaysOriginal)
        thirdItemSelectedImage?.withRenderingMode(.alwaysOriginal)
        
        forthItemImage?.withRenderingMode(.alwaysOriginal)
        forthItemSelectedImage?.withRenderingMode(.alwaysOriginal)
        
        
        
        customItems = [CustomTabbarItemImageTuple(defaultImage: firstItemImage!,
                                                  selectedImage: firstItemSelectedImage!,
                                                  imageInsets: firstItemImageInsets),
                       
                       CustomTabbarItemImageTuple(defaultImage: secondItemImage!,
                                                  selectedImage: secondItemSelectedImage!,
                                                  imageInsets: secondItemImageInsets),
                       
                       CustomTabbarItemImageTuple(defaultImage: thirdItemImage!,
                                                  selectedImage: thirdItemSelectedImage!,
                                                  imageInsets: thirdItemImageInsets),
                       
                       CustomTabbarItemImageTuple(defaultImage: forthItemImage!,
                                                  selectedImage: forthItemSelectedImage!,
                                                  imageInsets: forthItemImageInsets),
            
        ]
    }
    
}
