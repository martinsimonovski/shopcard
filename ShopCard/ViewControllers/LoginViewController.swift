//
//  LoginViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/23/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTxt: LoginScreenTextField!
    @IBOutlet weak var passwordTxt: LoginScreenTextField!
    @IBOutlet weak var loginBtn: LinearGradientButton!

    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)

        // Do any additional setup after loading the view.
        loginBtn.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func handleLogIn() {
        guard let email = emailTxt.text else { return }
        guard let password = passwordTxt.text else { return }

        loginBtn.setTitle("Logging in...", for: .normal)
        showHideError(show: false)

        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if (error == nil && user != nil) {
                print("User logged in")
                self.performSegue(withIdentifier: "toHomeScreen", sender: self)
            } else {
                print("Error loggin in: \(error!.localizedDescription)")
                self.showHideError(show: true, message: error!.localizedDescription)
            }
            
            self.loginBtn.setTitle("Login", for: .normal)
        }
    }


    
    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
