//
//  CustomGradient.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/8/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit


struct CustomGradient {
    
    var defaultBackgroundGradientLayer = CAGradientLayer()
    init(frame: CGRect) {
        self.defaultBackgroundGradientLayer = makeGradientLayer(frame: frame)
    }
    
    private func makeGradientLayer(frame: CGRect) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.PurpleColor.cgColor,
                                UIColor.MidPurpleColor.cgColor,
                                UIColor.LightPinkColor.cgColor,
                                UIColor.GoldenPinkColor.cgColor,
                                UIColor.GoldenYellowLight.cgColor,
                                UIColor.GoldenOrangeColor.cgColor]
        gradientLayer.frame.size = frame.size
        gradientLayer.startPoint = CGPoint(x: 0.45, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        return gradientLayer
    }
    
}
