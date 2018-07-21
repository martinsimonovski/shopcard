//
//  EditCardViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/21/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class EditCardViewController: UIViewController {
    var card: FirestoreCardModel? = nil
    
    @IBOutlet weak var nameFld: FloatLabelTextField!
    @IBOutlet weak var typesPicker: TypeModelPicker!
    @IBOutlet weak var barcodeFld: FloatLabelTextField!
    @IBOutlet weak var ownerFld: FloatLabelTextField!
    @IBOutlet weak var saveCardBtn: LinearGradientButton!
    @IBOutlet weak var deleteCardBtn: SecondaryButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    var ref: DatabaseReference? = nil
    let db = Firestore.firestore()

    var typeModelPicker: TypeModelPicker!
    var rotationAngle: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)
        
        ref = Database.database().reference()
        saveCardBtn.addTarget(self, action: #selector(saveCard), for: .touchUpInside)
        deleteCardBtn.addTarget(self, action: #selector(deleteCard), for: .touchUpInside)
        
        nameFld.text = card?.name
        barcodeFld.text = card?.barcode
        ownerFld.text = card?.owner
        
        setupTypePicker()
    }
    
    func setupTypePicker() {
        
        rotationAngle = -90 * (.pi/180)
        let y = typesPicker.frame.origin.y
        let x = typesPicker.frame.origin.x
        typesPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        typesPicker.frame = CGRect(x: x, y: y, width: 310, height: 80)
        
        typeModelPicker = TypeModelPicker()
        
        let types = Types.getTypes()
        typeModelPicker.modelData = types
        
        typesPicker.delegate = typeModelPicker
        typesPicker.dataSource = typeModelPicker
        
        let index = types.index { (item) -> Bool in
            item.id == card?.type
        }
        
        typesPicker.reloadAllComponents()
        typesPicker.selectRow(index!, inComponent: 0, animated: true)
    }
    
    @objc func saveCard() {
        guard let name = nameFld.text, name != "" else {
            self.showHideError(show: true, message: "Please insert name")
            return
        }
        guard let barcode = barcodeFld.text, barcode != "" else {
            self.showHideError(show: true, message: "Please insert barcode")
            return
        }
        guard let owner = ownerFld.text, owner != "" else {
            self.showHideError(show: true, message: "Please insert owner name")
            return
        }
        
        showHideError(show: false)
        saveCardBtn.setTitle("Saving card...", for: .normal)
        
        let uid = Auth.auth().currentUser?.uid
        let editCard = db.collection("cards").document((card?.id)!)
        let selectedType = typeModelPicker.getSelectedType() == 0 ? card?.type : typeModelPicker.getSelectedType()
        
        let data: [String : Any] = [
            "name": name,
            "type": selectedType,
            "barcode": barcode,
            "owner": owner,
            "user_id": uid ?? ""
        ]
        
        editCard.setData(data, merge: true) { error in
            if let error = error {
                print("Error writing document: \(error)")
                self.showHideError(show: true, message: error.localizedDescription)
            } else {
                self.performSegueToReturnBack()
                print("Document successfully written!")
            }
            
            self.saveCardBtn.setTitle("Save", for: .normal)
        }
    }
    
    @objc func deleteCard() {
        db.collection("cards").document((card?.id)!).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
                self.showHideError(show: true, message: error.localizedDescription)
            } else {
                self.performSegueToReturnBack()
                print("Document successfully removed!")
            }
        }
    }


    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }
    
    

}
