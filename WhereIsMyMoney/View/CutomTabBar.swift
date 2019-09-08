//
//  CutomTabBar.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/6/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class CustomTabBar : UITabBar {
    private var shapeLayer: CALayer?
    private var edgeInsets: UIEdgeInsets?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
        self.addBlurLayer()
//        self.itemPositioning = .centered
//        self.itemSpacing = self.frame.width/20
        
    }
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        if !LiveVariables.isiPhoneXFamily {
            sizeThatFits.height = 80
        }
        return sizeThatFits
    }

    private func addShape(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.TabBarFillColor.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.shadowColor = UIColor.TabBarShadowColor.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3.0)
        shapeLayer.shadowRadius = 3.0
        shapeLayer.shadowOpacity = 0.8
        
        if let olderShapeLater = self.shapeLayer {
            self.layer.replaceSublayer(olderShapeLater, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
        
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath()
        
        let archRadius = self.frame.width / 10 //TabBar CornerRadius
//        let roundedRectWidth = self.frame.width * (7/36)
        path.addArc(withCenter: CGPoint(x: archRadius, y: archRadius),
                    radius: archRadius,
                    startAngle: .pi,
                    endAngle: .pi * 1.5,
                    clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.width - archRadius, y: 0))
        path.addArc(withCenter: CGPoint(x: self.frame.width - archRadius, y: archRadius),
                    radius: archRadius,
                    startAngle: 1.5 * .pi,
                    endAngle: 2 * .pi,
                    clockwise: true)
        //complete the rectangle
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
    
    private func addBlurLayer(){
        let frost = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        frost.frame = self.frame
        
        frost.clipsToBounds = true
        self.insertSubview(frost, at: 0)
    }
    
    
}

