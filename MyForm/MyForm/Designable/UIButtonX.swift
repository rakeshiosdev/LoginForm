//
//  UIButtonX.swift
//  MyForm
//
//  Created by RakeshPC on 08/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit
@IBDesignable
class UIButtonX: UIButton {
    //    @IBInspectable var startColor:UIColor = orange{didSet{
    //        setNeedsDisplay()
    //        }}
    //    @IBInspectable var endColor:UIColor = red{didSet{
    //        setNeedsDisplay()
    //        }}
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            setNeedsDisplay()
        }}
    @IBInspectable var isCircular = true{
        didSet{
            setNeedsDisplay()
        }
    }
    
    //    override var bounds: CGRect{
    //        didSet{
    //            gradient.removeFromSuperlayer()
    //            gradient.frame = self.bounds
    //            self.layer.insertSublayer(self.gradient, at: 0)
    //        }
    //    }
    //    override var isEnabled: Bool{
    //        didSet{
    //            if isEnabled{
    //                setNeedsDisplay()
    //            }else{
    //                gradient.removeFromSuperlayer()
    //                self.backgroundColor = UIColor.gray
    //            }
    //
    //        }
    //    }
    //    private lazy var gradient: CAGradientLayer = {
    //        let gradientLayer = CAGradientLayer()
    //        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    //        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    //        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    //        gradientLayer.frame = self.bounds
    //        gradientLayer.cornerRadius = self.layer.cornerRadius
    //        return gradientLayer
    //    }()
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius =  isCircular ? self.frame.height / 2 : 1
        self.layer.masksToBounds = true
        //        self.layer.insertSublayer(self.gradient, at: 0)
    }
}
