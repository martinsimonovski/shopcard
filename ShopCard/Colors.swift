//
//  Colors.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/4/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

extension UIColor{
    struct Custom {
        struct Text {
            static let black = UIColor(red: (51/255.0), green: (51/255.0), blue: (51/255.0), alpha: 1.0)
            static let grey = UIColor(red: (171/255.0), green: (171/255.0), blue: (171/255.0), alpha: 1.0)
            static let link = UIColor(red: (158/255.0), green: (165/255.0), blue: (182/255.0), alpha: 1.0)
            static let accent = UIColor(red: (17/255.0), green: (208/255.0), blue: (185/255.0), alpha: 1.0)
            static let error = UIColor(red: (211/255.0), green: (45/255.0), blue: (123/255.0), alpha: 1.0)
        }
        
        struct Gradient {
            struct Primary {
                static let first = UIColor(red: (9.0/255.0), green: (204.0/255), blue: (192.0/255.0), alpha: 1.0)
                static let second = UIColor(red: (33.0/255.0), green: (215.0/255), blue: (170.0/255.0), alpha: 1.0)
                static let third = UIColor(red: (47.0/255.0), green: (222.0/255), blue: (154.0/255.0), alpha: 1.0)
            }
        }
        
        struct Static {
            static let blue = UIColor(red: (45.0/255.0), green: (207.0/255.0), blue: (221.0/255.0), alpha: 1.0)
        }
    }
}
