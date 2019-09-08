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
                item.image = CustomTabBarItemImages.shared.customItems[index].defaultImage
                item.selectedImage = CustomTabBarItemImages.shared.customItems[index].selectedImage
                item.imageInsets = CustomTabBarItemImages.shared.customItems[index].imageInsets
            }
        }
    }
    
}
