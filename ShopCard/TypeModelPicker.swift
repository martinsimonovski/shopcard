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
    var selectedType: Int = 0
    
    // because they will rotate that is why they are reversed (the image is like that)
    let customWidth: CGFloat = 80
    let customHeight: CGFloat = 140
    
    func getSelectedType() -> Int {
        return selectedType
    }
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
        imageView.image = UIImage(named: modelData[row].img)
        imageView.contentMode = UIViewContentMode.scaleAspectFit

        let y = view.frame.origin.y
        let x = view.frame.origin.x
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        view.frame = CGRect(x: x, y: y, width: customWidth, height: customHeight)

        view.addSubview(imageView)
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = modelData[row].id;
    }
}
