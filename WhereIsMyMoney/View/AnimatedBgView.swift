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
    private var roundedRectAnimationDuration: CFTimeInterval {
        return CFTimeInterval(animationDuration)
    }
    
    var numberOfRoundedRects : Int = 5
    
    ///duration to animate one
    var animationDuration: CGFloat = 30
    
    /// The timer used to start / stop rects animation
    private var roundedRectsAnimationTimer: Timer?
    
    //===================
    //MARK: Initializaers
    //===================
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
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
    
    //=============================
    //MARK: Rest Of Private Methods
    //=============================
    
    /// Add animation to rounded rects and the surrounding circles
    private func animateSublayers() {
        animateRoundedRects()
        startAnimation()
    }
    
    /// Animates roundedRects by changing color from off to on color
    @objc private func animateRoundedRects() {
        for index in 0 ..< roundedRectsLayer.count {
            let colorAnimation = Animation.color(from: UIColor.clear.cgColor, to: UIColor.RoundedRectOnColor.cgColor)
            let scalYAnimation = Animation.scaleY(from: 0.9, to: 1.1 + (CGFloat(index+1^2) * 0.1))
            let scalXAnimation = Animation.scaleX(from: 1.1 - (CGFloat(index) * 0.1), to: 1.05 + (CGFloat((index-2)^4) * 0.11))
            let alphaAnimation = Animation.opacity(from: 0.008, to: 0.080)
            
            let groupAnimation = Animation.group(animations: colorAnimation, scalXAnimation, scalYAnimation, alphaAnimation,
                                                 duration: CFTimeInterval(animationDuration/2),
                                                 beginTime: CACurrentMediaTime())
            roundedRectsLayer[index].add(groupAnimation, forKey: "strokeColor")
        }
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
    }
    
    private func drawRoundedRect(at position: UInt32) {
        let frameSize = self.frame.size
        let index = roundedRectsLayer.count
        let animatedBGModelViewInstance = AnimatedBGViewModel(frame: frameSize, index: index)
        let (startPoint, endPoint) = (animatedBGModelViewInstance.startPoint, animatedBGModelViewInstance.endPoint)
        let roundedRectLayer = Drawer.roundedRectLayer(start: startPoint, end: endPoint, color: UIColor.VagueWhiteColor.cgColor)
        roundedRectLayer.opacity = 0.001
        roundedRectsLayer.append(roundedRectLayer)
    }
}


//=====================
// MARK: Public methods
//=====================

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
