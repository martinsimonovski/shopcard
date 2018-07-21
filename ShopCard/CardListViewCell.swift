//
//  CardListViewCell.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/21/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import Foundation
import UIKit

class CardListViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var cardLogoImg: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLbl.sizeToFit()
    }
}
