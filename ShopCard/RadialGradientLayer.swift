//
//  RadialGradientLayer.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/4/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

@IBDesignable
class RadialGradientLayer: UIView {
    
    @IBInspectable var insideColor: UIColor = UIColor(displayP3Red: CGFloat(234.0/255.0), green: CGFloat(238.0/255.0), blue: CGFloat(242.0/255.0), alpha: 1.0)
    @IBInspectable var outsideColor: UIColor = UIColor.white
    
    override func draw(_ rect: CGRect) {
        let colors = [insideColor.cgColor, outsideColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 1.4
        let center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/1.3)
        
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
}
