//
//  ViewExtensions.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/8/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func changeSemantic(views : [UIView], semantic : UISemanticContentAttribute){
        for v in views {
            v.semanticContentAttribute = semantic
        }
    }
    func changeDirection(views : [UIView], direction : NSTextAlignment){
        for v in views {
            if let text = v as? UITextField{
                text.textAlignment = direction
            }else if let label = v as? UILabel{
                label.textAlignment = direction
            }else if let button = v as? UIButton{
                button.contentHorizontalAlignment = direction == .center ? .center : direction == .right ? .right : .left
            }
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboardView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboardView() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.view.endEditing(true)
        })
    }
}
extension UIView {
    func keepCenterAndApplyAnchorPoint(_ point: CGPoint) {
        
        guard layer.anchorPoint != point else { return }
        
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var c = layer.position
        c.x -= oldPoint.x
        c.x += newPoint.x
        
        c.y -= oldPoint.y
        c.y += newPoint.y
        
        layer.position = c
        layer.anchorPoint = point
    }
    
    @IBInspectable var supportMultiLanguage : Bool{
        get {
            return false
        }
        set {
            self.semanticContentAttribute = .unspecified
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return UIColor.clear
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
            layer.masksToBounds = false
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return UIColor.clear
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    
    func addShadow(){
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        self.layer.shouldRasterize = true
    }
    
    var colorPattern:String {
        get {
            return ""  // Not useful here.
        }
        set {
            self.backgroundColor = UIColor(patternImage: UIImage(named:newValue)!)
        }
    }
    
    func getParentViewController() -> UIViewController? {
        if self.next is UIViewController {
            return self.next as? UIViewController
        } else {
            //            if self.next != nil {
            //                return (self.next).getParentViewController()
            //            }
            //            else {return nil}
            return nil
        }
    }
    
    func getSubView(withIdentifier: String) -> UIView? {
        for subview in subviews {
            if subview.accessibilityIdentifier == withIdentifier {
                return subview
            }else {
                if subview.subviews.count > 0{
                    if let found = subview.getSubView(withIdentifier: withIdentifier) {
                        return found
                    }
                }
            }
        }
        return nil
    }
    
    func resetInputs(){
        for subview in subviews {
            if let textField = subview as? UITextField {
                textField.text = ""
            }else if let textView = subview as? UITextView {
                textView.text = ""
            }else if subview.subviews.count > 0 {
                subview.resetInputs()
            }
        }
    }
    func calcContentSize(view: UIView, width: Bool , height: Bool, extraSize: CGSize = CGSize.zero) -> CGSize {
        var size = view.frame.size
        var maxY = frame.maxY
        var maxX = 0.0 as CGFloat
        for v in view.subviews {
            if v.frame.maxY > maxY {
                maxY = v.frame.maxY
            }
            if v.frame.maxX > maxX {
                maxX = v.frame.maxX
            }
        }
        size = CGSize(width: width ? maxX : view.frame.width, height: height ? maxY : view.frame.height)
        size.width += extraSize.width
        size.height += extraSize.height
        return size
    }
    
    func changeSemantic(views : [UIView], semantic : UISemanticContentAttribute){
        for v in views {
            v.semanticContentAttribute = semantic
        }
    }
    
    func changeDirection(views : [UIView], direction : NSTextAlignment){
        for v in views {
            if let text = v as? UITextField{
                text.textAlignment = direction
            }else if let label = v as? UILabel{
                label.textAlignment = direction
            }else if let button = v as? UIButton{
                button.contentHorizontalAlignment = direction == .center ? .center : direction == .right ? .right : .left
            }
        }
    }
}

extension UIScrollView {
    func setContentSize(){
        for subview in subviews{
            if subview.frame.maxY > contentSize.height {
                contentSize = CGSize(width: contentSize.width, height: subview.frame.maxY)
            }
        }
        
    }
}

extension UIImageView {
    @objc func changeImageColorTo(color: UIColor, imageView: UIImageView) -> UIImageView {
        let templateImage = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.image = templateImage
        imageView.tintColor = color
        
        return imageView
    }
    
    
    @IBInspectable var circleMask: Bool {
        get {
            return false
        }
        set {
            if newValue {
                layer.cornerRadius = self.frame.size.height / 2
                layer.masksToBounds = true
            }else {
                layer.cornerRadius = 0
                layer.masksToBounds = false
            }
            
        }
    }
}
