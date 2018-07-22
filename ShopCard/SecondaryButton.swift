//
//  SecondaryButton.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/4/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

@IBDesignable
class SecondaryButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.tintColor = UIColor.Custom.Text.black
        self.layer.cornerRadius = 8.0;
        self.layer.masksToBounds = true;
        self.layer.borderWidth = 1.0;
        
        self.layer.borderColor = UIColor(red: (220.0/255.0), green: (227.0/255.0), blue: (232.0/255.0), alpha: 0.21).cgColor
        self.layer.borderWidth = 1;
        
    }
}
