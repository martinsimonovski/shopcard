//
//  TypeModel.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/10/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreTypeModel {
    var id: Int = 0
    var name: String = ""
    var img: String = ""
    
    init(id: Int, name: String, img: String) {
        self.id = id
        self.name = name
        self.img = img
    }
}
