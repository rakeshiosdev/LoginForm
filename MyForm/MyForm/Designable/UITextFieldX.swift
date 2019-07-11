//
//  UITextFieldX.swift
//  MyForm
//
//  Created by RakeshPC on 08/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit
@IBDesignable
class UITextFieldX: UITextField {
    
    
    func addBottomLine(width: CGFloat, img: UIImage?) {
        if img != nil {
            let leftImgView = UIImageView(frame: CGRect(x: 2, y: 7, width: 16, height: 16))
            leftImgView.image = img
            
            let paddingView = UIView(frame: CGRect(x: 20, y: 0, width: 8, height: 30))
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 28, height: 30))
            
            leftView.addSubview(leftImgView)
            leftView.addSubview(paddingView)
            
            self.leftView = leftView
            self.leftViewMode = .always
        }
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 0.5, width: width, height: 0.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
    
    @IBInspectable var placeholderX: String! {
        didSet {
            let placeholder = NSAttributedString(string: placeholderX, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            self.attributedPlaceholder = placeholder
        }
    }
    
    @IBInspectable var cornerRadius = 3{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var borderColor = UIColor.darkGray{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var borderWidth:CGFloat = 1{
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var top:CGFloat = 5{
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var bottom:CGFloat = 5{
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var left:CGFloat = 5{
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var right:CGFloat = 5{
        didSet {
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
    }
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by:UIEdgeInsets(top:top, left: left, bottom: bottom, right: right))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top:top, left: left, bottom: bottom, right: right))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top:top, left: left, bottom: bottom, right: right))
    }
    
}
