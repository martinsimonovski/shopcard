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
        
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

}
