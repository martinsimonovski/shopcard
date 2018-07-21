//
//  HomeViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/26/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
   
    @IBOutlet weak var cardListView: UITableView!
    var listCardTable: ListCardsTableView!
    var cards: [FirestoreCardModel]! = []
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        cardListView.backgroundColor = UIColor.clear
        
        getCards()
    }
    
    @objc func getCards() {
        let uid = Auth.auth().currentUser?.uid
        db.collection("cards").whereField("user_id", isEqualTo: uid!)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let myData = document.data()
                        let card = FirestoreCardModel(id: document.documentID, name: myData["name"] as! String, type: myData["type"] as! Int, barcode: myData["barcode"] as! String, owner: myData["owner"] as! String, user_id: myData["user_id"] as! String)
                        
                        self.cards.append(card)
                    }
                    self.fillCardsData()
                }
        }
    }
    
    @objc func fillCardsData() {
        listCardTable = ListCardsTableView()
        
        listCardTable.tableData = cards
        cardListView.backgroundColor = UIColor.clear
        cardListView.delegate = listCardTable
        cardListView.dataSource = listCardTable
        cardListView.reloadData()
    }

}
