//
//  ViewController.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/6/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import UIKit


class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeItemImagesAndPlaces()
        customizeTabBarColors()
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //print("shit just selected")
    }
    

    private func customizeTabBarColors() {
        self.tabBar.unselectedItemTintColor = .TabBarItemUnselectedColor
        self.tabBar.tintColor = .purple
        self.tabBar.tintAdjustmentMode = .normal
    }
    private func customizeItemImagesAndPlaces(){
        if let items = self.tabBar.items {
            for (index,item) in items.enumerated() {
                switch index {
                case 0 :
                    let image = UIImage(named: "dashboardIocn")
                    image?.withRenderingMode(.alwaysOriginal)
                    item.image = image
                    let selectedImage = UIImage(named: "dashboardIocnSelected")
                    selectedImage?.withRenderingMode(.alwaysOriginal)
                    item.selectedImage = selectedImage
                    let insets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 22, left: 10, bottom: -21, right: -10) : UIEdgeInsets(top: 10, left: 10, bottom: -9, right: -10)
                    item.imageInsets = insets
                    
                case 1 :
                    let image = UIImage(named: "calendarIcon")
                    image?.withRenderingMode(.alwaysOriginal)
                    item.image = image
                    let selectedImage = UIImage(named: "calendarIconSelected")
                    selectedImage?.withRenderingMode(.alwaysOriginal)
                    item.selectedImage = selectedImage
                    let insets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0) : UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
                    item.imageInsets = insets
                    
                case 2 :
                    let image = UIImage(named: "profileIcon")
                    image?.withRenderingMode(.alwaysOriginal)
                    item.image = image
                    let selectedImage = UIImage(named: "profileIconSelected")
                    selectedImage?.withRenderingMode(.alwaysOriginal)
                    item.selectedImage = selectedImage
                    let insets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 20, left: -10, bottom: -20, right: 10) : UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
                    item.imageInsets = insets
                    
                case 3 :
                    let image = UIImage(named: "addBtn")
                    image?.withRenderingMode(.alwaysOriginal)
                    item.image = image
                    let insets = LiveVariables.shared.isiPhoneXFamily ? UIEdgeInsets(top: 8, left: -1, bottom: -8, right: 6) : UIEdgeInsets(top: -10, left: -3, bottom: 10, right: 8)
                    let selectedImage = UIImage(named: "addBtnSelected")
                    image?.withRenderingMode(.alwaysOriginal)
                    item.selectedImage = selectedImage
                    item.imageInsets = insets
                    
                default:
                    break
                }
            }
        }
    }
    
}
