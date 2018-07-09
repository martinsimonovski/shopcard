//
//  LauncherViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/4/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LauncherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        // style
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        // height
        let height: CGFloat = 12
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)

        setCustomBackImage()
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    func setCustomBackImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "Shape")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "Shape")
        navigationController?.navigationBar.tintColor = UIColor.Custom.Text.link
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser  {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }

}
