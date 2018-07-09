//
//  ActionsViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/9/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ActionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func handleLogout(_target: UIButton) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "toLaunchScreen", sender: self)
    }

}
