//
//  AddCardViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/28/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
//import FirebaseDatabase

class AddCardViewController: UIViewController {

    @IBOutlet weak var nameTxt: FloatLabelTextField!
    @IBOutlet weak var barcodeTxt: FloatLabelTextField!
    @IBOutlet weak var ownerTxt: FloatLabelTextField!
    @IBOutlet weak var addBtn: LinearGradientButton!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var typesPicker: UIPickerView!
    
    var ref: DatabaseReference? = nil
    let db = Firestore.firestore()
    var typeModelPicker: TypeModelPicker!
    
    var rotationAngle: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)
        ref = Database.database().reference()
        addBtn.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        setupTypePicker()
    }
    
    func setupTypePicker() {
        
        rotationAngle = -90 * (.pi/180)
        let y = typesPicker.frame.origin.y
        let x = typesPicker.frame.origin.x
        typesPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        typesPicker.frame = CGRect(x: x, y: y, width: 310, height: 80)
        
        typeModelPicker = TypeModelPicker()
        
        typeModelPicker.modelData = Types.getTypes()
        
        typesPicker.delegate = typeModelPicker
        typesPicker.dataSource = typeModelPicker
        typesPicker.reloadAllComponents()
    }
    
    @objc func addCard() {
        guard let name = nameTxt.text, name != "" else {
            self.showHideError(show: true, message: "Please insert name")
            return
        }
        guard let barcode = barcodeTxt.text, barcode != "" else {
            self.showHideError(show: true, message: "Please insert barcode")
            return
        }
        guard let owner = ownerTxt.text, owner != "" else {
            self.showHideError(show: true, message: "Please insert owner name")
            return
        }
        
        showHideError(show: false)
        addBtn.setTitle("Adding card...", for: .normal)
        
        let uid = Auth.auth().currentUser?.uid
        let newCard = db.collection("cards").document()
        let selectedType = typeModelPicker.getSelectedType() == 0 ? typeModelPicker.modelData[0].id : typeModelPicker.getSelectedType()
        
        let data: [String : Any] = [
            "name": name,
            "type": selectedType,
            "barcode": barcode,
            "owner": owner,
            "user_id": uid ?? ""
        ]
        
        newCard.setData(data, merge: true) { error in
            if let error = error {
                print("Error writing document: \(error)")
                self.showHideError(show: true, message: error.localizedDescription)
            } else {
                self.performSegueToReturnBack()
                print("Document successfully written!")
            }
            
            self.addBtn.setTitle("Add", for: .normal)
        }
    }
    
    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
