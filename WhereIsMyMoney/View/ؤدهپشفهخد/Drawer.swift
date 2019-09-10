//
//  Drawer.swift
//  WhereIsMyMoney
//
//  Modified by sajede nouri on 9/8/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//
//  Created by Hamza Ghazouani on 24/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
import Foundation
import UIKit

struct Drawer {
    
    /// Creates a rounded Rect layer
    ///
    /// - Parameters:
    ///   - start: the radius of the circle
    ///   - end: the origin of the circle
    /// - Returns: a rouned rect layer
    private static func layer(start: CGPoint, end: CGPoint) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.bounds = CGRect(x: 0, y: 0, width: end.x - start.x, height: end.y - start.y)
        layer.position = CGPoint(x: (end.x + start.x)/CGFloat(2),
                                 y: (end.y + start.y)/CGFloat(2))
        let path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: LiveVariables.shared.defaultCornerRadius*2.5).cgPath
        layer.path = path
        
        return layer
    }
    
    
    /// Creates a circular layer
    ///
    /// - Parameters:
    ///   - radius: the radius of the circle
    ///   - origin: the origin of the circle
    /// - Returns: a circular layer
    private static func layer(radius: CGFloat, origin: CGPoint) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        layer.position = origin
        
        let center = CGPoint(x: radius, y: radius)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        layer.path = path.cgPath
        
        return layer
    }
    
    /// Creates a disk layer
    ///
    /// - Parameters:
    ///   - radius: the radius of the disk
    ///   - origin: the origin of the disk
    ///   - color: the color of the disk
    /// - Returns: a disk layer
    static func diskLayer(radius: CGFloat, origin: CGPoint, color: CGColor) -> CAShapeLayer {
        let diskLayer = self.layer(radius: radius, origin: origin)
        diskLayer.fillColor = color
        return diskLayer
    }
    
    /// Creates a circle layer
    ///
    /// - Parameters:
    ///   - radius: the radius of the circle
    ///   - origin: the origin of the circle
    ///   - color: the color of the circle
    /// - Returns: a circle layer
    static func circleLayer(radius: CGFloat, origin: CGPoint, color: CGColor) -> CAShapeLayer {
        let circleLayer = self.layer(radius: radius, origin: origin)
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color
        circleLayer.lineWidth = 1.0
        
        return circleLayer
    }
    
    
    /// Creates a rounded rect layer
    ///
    /// - Parameters:
    ///   - start: start point of the rect as the rouned rect frame
    ///   - end: end point of the rect as the rouned rect frame
    ///   - color: the color of the rounded rect
    /// - Returns: a reouned rect layer
    static func roundedRectLayer(start: CGPoint, end: CGPoint, color: CGColor = UIColor.VagueWhiteColor.cgColor) -> CAShapeLayer {
        let roundedRectLayer = self.layer(start: start, end: end)
        roundedRectLayer.fillColor = color
        roundedRectLayer.strokeColor = UIColor.clear.cgColor
        roundedRectLayer.lineWidth = 0.0
        
        return roundedRectLayer
    }
    
}
