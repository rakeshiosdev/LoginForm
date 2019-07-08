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
