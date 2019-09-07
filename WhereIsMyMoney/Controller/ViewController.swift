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
        
        customizeTheLastItem()
        self.tabBar.unselectedItemTintColor = .TabBarItemUnselectedColor
        self.tabBar.tintColor = .purple
        self.tabBar.tintAdjustmentMode = .normal
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("shit just selected")
    }
    
//
//    func customizeTheLastItem(){
//        if let items = self.tabBar.items {
//            let customAddItem = items.last
//
//        }
//    }
//
//
    func customizeTheLastItem(){
        if let items = self.tabBar.items {
            let customAddItem = items.last
            
            let image = UIImage(named: "addBtn")
            image?.withRenderingMode(.alwaysOriginal)
            customAddItem?.image = image
            
//            let insets = UIEdgeInsets(top: -5,
//                                      left: 0,
//                                      bottom: 5,
//                                      right: 0)
            let selectedImage = UIImage(named: "addBtnSelected")
            //selectedImage?.resizableImage(withCapInsets: insets,
                                         // resizingMode: .stretch)
            image?.withRenderingMode(.alwaysOriginal)
            customAddItem?.selectedImage = selectedImage
            
            //customAddItem?.imageInsets = UIEdgeInsets(top: -5,
//                                                      left: 0,
//                                                      bottom: 5,
//                                                      right: 0)
        }
    }
    
}
