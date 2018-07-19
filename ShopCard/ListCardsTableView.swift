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
}

extension ListCardsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")
        cell?.textLabel?.text = tableData[indexPath.row].name
//        cell.setup(model: tableData[indexPath.section].data[indexPath.row])
        return cell!
    }
}

extension ListCardsTableView: UITableViewDelegate {
    
}
