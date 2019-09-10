//
//  AnimatedBGViweModel.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/10/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit

struct AnimatedBGViewModel {
    
    var startPoint: CGPoint = CGPoint()
    var endPoint : CGPoint = CGPoint()
    
    private var screenHeight : CGFloat!
    private var screenWidth : CGFloat!
    
    private var possibleYStart : [CGFloat] = []
    private var possibleXStart : [CGFloat] = []
    private var possibleWidth : [CGFloat] = []
    private var possibleHeight : [CGFloat] = []
    private var index : Int = 0
    
    init(frame: CGSize, index: Int){
        self.index = index
        self.screenHeight = frame.height
        self.screenWidth = frame.width
        calculatePossibleWidthNHeight()
        (self.startPoint, self.endPoint) = selectStartNEndRandomly()
    }
    
    private mutating func calculatePossibleWidthNHeight(){
        
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
        
        if self.index > 0 {
            let theRoundedRectCurrentIndex = self.index
            
            randomStartPoint = CGPoint(x: self.possibleXStart[theRoundedRectCurrentIndex] + randomVariationsForStart[theRoundedRectCurrentIndex],
                                       y: self.possibleYStart[theRoundedRectCurrentIndex])
            
            randomEndPoint = CGPoint(x: self.possibleXStart[theRoundedRectCurrentIndex] + possibleWidth[theRoundedRectCurrentIndex] + randomVariationsForEnd[theRoundedRectCurrentIndex],
                                     y: self.possibleYStart[theRoundedRectCurrentIndex] + self.possibleHeight[theRoundedRectCurrentIndex] + randomVariationsForEnd[theRoundedRectCurrentIndex])
            
        }
        print("The index is : \(self.index) - the start and end point of the rounded rects is : \(randomStartPoint), \(randomEndPoint)")
        return (randomStartPoint, randomEndPoint)
    }
    
}
