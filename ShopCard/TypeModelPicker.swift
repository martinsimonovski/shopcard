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
    let customWidth: CGFloat = 310
    let customHeight: CGFloat = 33
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
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        let label = UILabel(frame: CGRect(x: 75, y: 0, width: 100, height: customHeight))
        label.text = modelData[row].name
        label.textColor = UIColor.Custom.Text.black
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 18.0)
        
        
        let imageView = UIImageView(frame: CGRect(x: 175, y: 0, width: 60, height: 33))
        switch modelData[row].img {
            case "tinex":
                imageView.image = UIImage(named: "tinex")
            case "vero":
                imageView.image = UIImage(named: "vero")
            case "ramstore":
                imageView.image = UIImage(named: "ramstore")
            default:
                imageView.image = nil
        }
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        view.addSubview(label)
        view.addSubview(imageView)
        
        return view
    }
}
