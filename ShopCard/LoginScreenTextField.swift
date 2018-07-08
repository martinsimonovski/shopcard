//
//  LoginScreenTextField.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/24/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

@IBDesignable
class LoginScreenTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 5;
//        self.layer.masksToBounds = true;
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.Custom.Text.grey.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.textColor = .black
        self.tintColor = .orange
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

}
