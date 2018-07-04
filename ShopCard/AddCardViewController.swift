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

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var typeTxt: UITextField!
    @IBOutlet weak var serialNumberTxt: UITextField!
    @IBOutlet weak var addCardBtn: UIButton!
    
    var ref: DatabaseReference? = nil
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        addCardBtn.addTarget(self, action: #selector(addCard), for: .touchUpInside)
    }

    @objc func addCard() {
//        guard let name = nameTxt.text else { return }
//        guard let type = typeTxt.text else { return }
//        guard let serialNumber = serialNumberTxt.text else { return }
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

        let barcode = String(arc4random_uniform(10000000))
        let data: [String : Any] = [
            barcode: [
                "type": "tinex",
                "number": barcode,
                "owner": "John Doe"
            ]
        ]
        db.collection("cards").document(uid!).setData(data, merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

}
