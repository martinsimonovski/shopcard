//
//  TypeModelPicker.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/10/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

class TypeModelPicker: UIPickerView {
    var modelData: [FirestoreTypeModel]!
    
    // because they will rotate that is why they are reversed (the image is like that)
    let customWidth: CGFloat = 80
    let customHeight: CGFloat = 140
}

extension TypeModelPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
}

extension TypeModelPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return customWidth
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
       
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: customHeight, height: customWidth))
        switch modelData[row].img {
            case "tinex":
                imageView.image = UIImage(named: "tinex-card")
            case "vero":
                imageView.image = UIImage(named: "vero-card")
            case "ramstore":
                imageView.image = UIImage(named: "ramstore-card")
            case "zito":
                imageView.image = UIImage(named: "zito-card")
            default:
                imageView.image = nil
        }
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        var y = view.frame.origin.y
        var x = view.frame.origin.x
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        view.frame = CGRect(x: x, y: y, width: customWidth, height: customHeight)

        view.addSubview(imageView)
        
        return view
    }
}
