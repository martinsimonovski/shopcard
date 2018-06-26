//
//  ButtonPrimary.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/26/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonPrimary: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
    }
}
