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
    var tableData: [FirestoreCardModel]! = []
    
    let db = Firestore.firestore()
    let customHeight: CGFloat = 64
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        cardListView.dataSource = self
        cardListView.delegate = self
        cardListView.backgroundColor = UIColor.clear
        cardListView.isHidden = true
        
        if #available(iOS 10.0, *) {
            cardListView.refreshControl = refreshControl
        } else {
            cardListView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(getCards), for: .valueChanged)
        
        getCards()
    }
    
    @objc func getCards() {
        
        let uid = Auth.auth().currentUser?.uid
        db.collection("cards").whereField("user_id", isEqualTo: uid!)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.tableData = []
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let myData = document.data()
                        let card = FirestoreCardModel(id: document.documentID, name: myData["name"] as! String, type: myData["type"] as! Int, barcode: myData["barcode"] as! String, owner: myData["owner"] as! String, user_id: myData["user_id"] as! String)
                        
                        self.tableData.append(card)
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.cardListView.reloadData()
                        self.refreshControl.endRefreshing()
//                        self.activityIndicatorView.stopAnimating()
                        self.cardListView.isHidden = false
                    }
                }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! CardListViewCell
        cell.titleLbl.text = tableData[indexPath.row].name
        cell.cardLogoImg.image = UIImage(named: tableData[indexPath.row].getImageName())
        
        // alignment
        var x = cell.titleLbl.frame.origin.x
        cell.titleLbl.sizeToFit()
        cell.titleLbl.textAlignment = .center
        var y = customHeight/2 - cell.titleLbl.frame.height/2
        cell.titleLbl.frame = CGRect(x: x, y: y, width: cell.titleLbl.frame.width, height: cell.titleLbl.frame.height)
        
        x = cell.cardLogoImg.frame.origin.x
        y = customHeight/2 - cell.cardLogoImg.frame.height/2
        cell.cardLogoImg.frame = CGRect(x: x, y: y, width: 48, height: 24)
        
        // style
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction  = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            print("Edit Button tapped. Row item value = \(self.tableData[indexPath.row])")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let EditCardVC = storyboard.instantiateViewController(withIdentifier: "EditCardViewController") as! EditCardViewController
            EditCardVC.card = self.tableData[indexPath.row]
            self.navigationController?.pushViewController(EditCardVC, animated: true)
        }
        
        editAction.backgroundColor = UIColor.Custom.Static.blue
        return [editAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt didSelectRowAtIndexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let BarcodeVC = storyboard.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        BarcodeVC.card = self.tableData[didSelectRowAtIndexPath.row]
        self.navigationController?.pushViewController(BarcodeVC, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.customHeight
    }
}
