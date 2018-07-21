//
//  ListCardsTableView.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/19/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit

class ListCardsTableView: UITableView {
    var tableData: [FirestoreCardModel]!
    let customHeight: CGFloat = 64
}

extension ListCardsTableView: UITableViewDataSource {
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
        cell.titleLbl.frame = CGRect(x: x, y: y, width: bounds.width, height: cell.titleLbl.frame.height)
        
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
//            self.displayShareSheet(indexPath)
        }
            
        editAction.backgroundColor = UIColor.Custom.Static.blue
        return [editAction]
    }
}

extension ListCardsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.customHeight
    }
    
    
}
