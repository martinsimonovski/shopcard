//
//  LinearGradientButton.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/4/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

@IBDesignable
class LinearGradientButton: UIButton {

    @IBInspectable var firstColor: UIColor = UIColor.Custom.Gradient.Primary.first
    @IBInspectable var secondColor: UIColor = UIColor.Custom.Gradient.Primary.second
    @IBInspectable var thirdColor: UIColor = UIColor.Custom.Gradient.Primary.third

    override func draw(_ rect: CGRect) {
        // Drawing code
        let layer: CAGradientLayer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        layer.locations = [0.0, 0.65, 1]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 0)
        layer.frame = self.bounds
        self.layer.insertSublayer(layer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tintColor = UIColor.white
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = true;
    }

}
