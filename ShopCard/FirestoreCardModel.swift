//
//  FirestoreCardModel.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/19/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreCardModel {
    var id: String = ""
    var name: String = ""
    var type: Int = 0
    var barcode: String = ""
    var owner: String = ""
    var user_id: String = ""
    
    init(id: String, name: String, type: Int, barcode: String, owner: String, user_id: String) {
        self.id = id
        self.name = name
        self.type = type
        self.barcode = barcode
        self.owner = owner
        self.user_id = user_id
    }
}
