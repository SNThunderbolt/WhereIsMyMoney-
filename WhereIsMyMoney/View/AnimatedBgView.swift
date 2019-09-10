//
//  animatedBgView.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/9/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit

class AnimatedBackgroundView: BackgroundView {
    
    private var roundedRectsLayer = [CAShapeLayer]()
    private var roundedrectsLayerNIndexTuple = [(roundedRectLayer: CAShapeLayer, layerIndex: Int)]()
    
    private var roundedRectAnimationDuration: CFTimeInterval {
        if roundedRectsLayer.count == 0 {
            return CFTimeInterval(animationDuration)
        }
        return CFTimeInterval(animationDuration)// / CFTimeInterval(roundedRectsLayer.count)
    }
    
    var numberOfRoundedRects : Int = 5
    
    ///duration to animate one
    var animationDuration: CGFloat = 30
    
    /// The color of the off status of the rounded Rect, used for animation
   var roundedRectOffColor: UIColor = .VagueWhiteColor {
        didSet {
            roundedRectsLayer.forEach {
                $0.strokeColor = roundedRectOffColor.cgColor
            }
        }
    }

    /// The timer used to start / stop rects animation
    private var roundedRectsAnimationTimer: Timer?
    
    
    private var screenHeight : CGFloat!
    private var screenWidth : CGFloat!
    private var possibleYStart : [CGFloat]!
    private var possibleXStart : [CGFloat]!
    private var possibleWidth : [CGFloat]!
    private var possibleHeight : [CGFloat]!
    
    /// All available position to draw items
    private var availablePositions = [CGPoint]()
    
    /// items drawn in the radar view
    private var itemsViews = [ItemView]()
    
    /// layer to remove after hidden animation
    private var viewToRemove: UIView?
    
    
    
    
    //MARK: Initializaers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        calculatePossibleWidthNHeight()
        drawSublayers()
        stopAnimation()
        animateSublayers()
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for layer in roundedRectsLayer {
            self.layer.addSublayer(layer)
        }
    }
    /// Add animation to rounded rects and the surrounding circles
    private func animateSublayers() {
        animateRoundedRects()
        
        startAnimation()
    }
    
    /// Animates roundedRects by changing color from off to on color
    @objc private func animateRoundedRects() {
        for index in 0 ..< roundedRectsLayer.count {
            let colorAnimation = Animation.color(from: UIColor.clear.cgColor, to: UIColor.RoundedRectOnColor.cgColor)
//            let scaleAnimation = Animation.transform(from: 0.9, to: 1.14)
            let scalYAnimation = Animation.scaleY(from: 0.9, to: 1.1 + (CGFloat(index+1^2) * 0.1))
            let scalXAnimation = Animation.scaleX(from: 1.1 - (CGFloat(index) * 0.1), to: 1.05 + (CGFloat((index-2)^4) * 0.11))
            let alphaAnimation = Animation.opacity(from: 0.008, to: 0.080)
//            let alphaAnimation = Animation.opacity(from: 1.0, to: 0.880)
            
            let groupAnimation = Animation.group(animations: colorAnimation, scalXAnimation, scalYAnimation, alphaAnimation,
                                                 duration: CFTimeInterval(animationDuration/2),
                                                 beginTime: CACurrentMediaTime())
            roundedRectsLayer[index].add(groupAnimation, forKey: "strokeColor")
            
        }
    }
    
    private func calculatePossibleWidthNHeight(){
        self.screenHeight = self.frame.size.height
        self.screenWidth = self.frame.size.width
        
        let firstYStart = screenHeight*(-2/8)
        let scndYStart = screenHeight*(7/100)
        let thrdYStart = screenHeight*(20/80)
        let frthYStart = screenHeight*(25/80)
        let ffthYStart = screenHeight*(50/80)
        self.possibleYStart = [firstYStart, scndYStart, thrdYStart, frthYStart, ffthYStart]
        
        
        let frstXStart = screenWidth*(6/8)
        let scndXStart = screenWidth*(5/8)
        let thrdXStart = screenWidth*(-15/100)
        let frthXStart = screenWidth*(-1/8)
        let ffthXStart = screenHeight*(1/8)
        self.possibleXStart = [frstXStart, scndXStart, thrdXStart, frthXStart, ffthXStart]
        
        let frstWdth = screenWidth*(1/5)
        let scndWdth = screenWidth*(3/5)
        let thrdWdth = screenWidth*(1/3)
        let frthWdth = screenWidth*(1/3)
        let ffthWdth = screenWidth*(4/7)
        self.possibleWidth = [frstWdth, scndWdth, thrdWdth, frthWdth, ffthWdth]
        
        let frstHght = screenHeight*(2/5)
        let scndHght = screenHeight*(1/8)
        let thrdHeght = screenHeight*(15/100)
        let frthHght = screenHeight*(10/100)
        let ffthHght = screenHeight*(1/7)
        self.possibleHeight = [frstHght, scndHght, thrdHeght, frthHght, ffthHght]
        
    }
    
    
    /// Draws rounded rects
    private func drawSublayers() {
        redrawRoundedRects()
    }
    
    
    /// Redraws rects by deleting the old ones and drawing a new ones, called for example when the size changed
    private func redrawRoundedRects() {
        roundedRectsLayer.forEach{
            $0.removeFromSuperlayer()
        }
        roundedRectsLayer.removeAll()
        for i in 0 ..< numberOfRoundedRects {
            drawRoundedRect(at: UInt32(i))
        }
        roundedrectsLayerNIndexTuple.removeAll()
    }
    
    private func drawRoundedRect(at position: UInt32) {
        let (startPoint, endPoint) = selectStartNEndRandomly()
        
        let roundedRectLayer = Drawer.roundedRectLayer(start: startPoint, end: endPoint, color: UIColor.VagueWhiteColor.cgColor)
        roundedRectLayer.opacity = 0.001
        roundedRectsLayer.append(roundedRectLayer)
        //        self.layer.insertSublayer(diskLayer, at: index)
        roundedrectsLayerNIndexTuple.append((roundedRectLayer: roundedRectLayer,
                                             layerIndex: (self.layer.sublayers?.count ?? 1) - 1))
    }
    
    private func selectStartNEndRandomly() -> (startPoint: CGPoint, endPoint: CGPoint) {
        
        let randomVariationsForStart = [CGFloat(Int.random(in: 5 ..< 12)),
                                        CGFloat(Int.random(in: 13 ..< 25)),
                                        CGFloat(Int.random(in: -10 ..< 10)),
                                        CGFloat(Int.random(in: -10 ..< 0)),
                                        CGFloat(Int.random(in: -110 ..< -95))]
        let randomVariationsForEnd = [CGFloat(Int.random(in: 5 ..< 12)),
                                      CGFloat(Int.random(in: -2 ..< 5)),
                                      CGFloat(Int.random(in: -85 ..< 0)),
                                      CGFloat(Int.random(in: 5 ..< 18)),
                                      CGFloat(Int.random(in: -90 ..< -75))]
        
        var randomStartPoint = CGPoint(x: possibleXStart[0] + randomVariationsForStart[0],
                                       y: possibleYStart[0])
        var randomEndPoint = CGPoint(x: possibleXStart[0] + possibleWidth[0] + randomVariationsForEnd[0],
                                     y: possibleYStart[0] + possibleHeight[0] + randomVariationsForEnd[0])
        
        
        if roundedRectsLayer.count > 0 {
            let theRoundedRectCurrentIndex = roundedRectsLayer.count
            
            randomStartPoint = CGPoint(x: possibleXStart[theRoundedRectCurrentIndex] + randomVariationsForStart[theRoundedRectCurrentIndex],
                                       y: possibleYStart[theRoundedRectCurrentIndex])
            
            randomEndPoint = CGPoint(x: possibleXStart[theRoundedRectCurrentIndex] + possibleWidth[theRoundedRectCurrentIndex] + randomVariationsForEnd[theRoundedRectCurrentIndex],
                                     y: possibleYStart[theRoundedRectCurrentIndex] + possibleHeight[theRoundedRectCurrentIndex] + randomVariationsForEnd[theRoundedRectCurrentIndex])
            
        }
        print("The index is : \(roundedRectsLayer.count) - the start and end point of the rounded rects is : \(randomStartPoint), \(randomEndPoint)")
        return (randomStartPoint, randomEndPoint)
    }
    
    func radiusOfRoundRect(rect: CAShapeLayer) -> CGFloat {
        return min(rect.frame.width, rect.frame.height)
    }
    
}

// MARK: Public methods
extension AnimatedBackgroundView {
    /// Start the ripple animation
    public func startAnimation() {
        layer.removeAllAnimations()
        roundedRectsAnimationTimer?.invalidate()
        let timeInterval = CFTimeInterval(animationDuration)
        roundedRectsAnimationTimer =  Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(animateRoundedRects), userInfo: nil, repeats: true)
    }
    
    /// Stop the ripple animation
    public func stopAnimation() {
        layer.removeAllAnimations()
        roundedRectsAnimationTimer?.invalidate()
    }
}
