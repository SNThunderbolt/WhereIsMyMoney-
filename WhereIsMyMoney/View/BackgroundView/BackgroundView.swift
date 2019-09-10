//
//  BackgroundView.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/8/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit

class BackgroundView : UIView {
    
    override func awakeFromNib() {
        addGradientColorToLayer()
    }
    
    private func addGradientColorToLayer(){
        let gradientLayer = CustomGradient(frame: self.frame).defaultBackgroundGradientLayer
        self.layer.addSublayer(gradientLayer)
    }
}

