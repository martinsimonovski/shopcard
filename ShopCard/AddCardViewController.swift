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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)
        ref = Database.database().reference()
        
        addBtn.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        
        getTypes()
    }

    
    
    func setTypeModelPicker(types: [FirestoreTypeModel]) {
        print("PICKER: ", types)
        typeModelPicker = TypeModelPicker()
        
        typeModelPicker.modelData = types
        
        typesPicker.delegate = typeModelPicker
        typesPicker.dataSource = typeModelPicker
        typesPicker.reloadAllComponents()
    }
    
    func getTypes() {
        var types: [FirestoreTypeModel] = []
        
        db.collection("types").getDocuments() { (querySnapshot, error) in
            if (error != nil) {
                print("Error getting types: \(error)")
            } else {
                print("documents: ", querySnapshot!.documents)
                for document in querySnapshot!.documents {
                    let myData = document.data()
                    
                    print("\(document.documentID) => \(document.data())")
                    let model: FirestoreTypeModel = FirestoreTypeModel(id: document.documentID, name: myData["name"] as! String, img: myData["img"] as! String)
                    types.append(model)
                }
                
                print("SHOPCARD: ", types)
                self.setTypeModelPicker(types: types)
            }
        }
    }

    @objc func addCard() {
        self.showHideError(show: false)
        
        guard let name = nameTxt.text else { return }
//        guard let type = typeTxt.text else { return }
        guard let barcode = barcodeTxt.text else { return }
        guard let owner = ownerTxt.text else { return }
        
        print("addCard")
        
        
        //        let data = ["Fornavn": "Fornavn","Efternavn": "Efternavn"]
        
//        self.ref.child("cards").child(uid!).setValue(data)
//        self.ref.child("cards").child("45thZ5aWIBfPGw8IWNHV").setValue(data, withCompletionBlock: { (error: Error?, ref:DatabaseReference ) in
//            if let error = error {
//                print("Data could not be saved: \(error).")
//            } else {
//                print("Data saved successfully!")
//            }
//        })
        
        
//        self.ref.child("cards").child(uid!).setValue(["name": "My tinex", "serialNumber": "1238612372163", "type": "tinex"])

        let uid = Auth.auth().currentUser?.uid;
        print(uid!)

        let data: [String : Any] = [
            barcode: [
                "name": name,
                "type": "tinex",
                "barcode": barcode,
                "owner": owner
            ]
        ]
        db.collection("cards").document(uid!).setData(data, merge: true)  { error in
            if let error = error {
                print("Error writing document: \(error)")
                self.showHideError(show: true, message: error.localizedDescription)
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
