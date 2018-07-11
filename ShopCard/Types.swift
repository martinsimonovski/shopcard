//
//  Types.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/12/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import Foundation

class Types{
    class func getTypes() -> [FirestoreTypeModel] {
        var data = [FirestoreTypeModel]()
        data.append(FirestoreTypeModel(id: 1, name: "Tinex", img: "tinex-card"))
        data.append(FirestoreTypeModel(id: 2, name: "Ramstore", img: "ramstore-card"))
        data.append(FirestoreTypeModel(id: 3, name: "Vero", img: "vero-card"))
        data.append(FirestoreTypeModel(id: 4, name: "Zito", img: "zito-card"))
        
        return data
    }
}
