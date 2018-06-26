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
    @IBOutlet weak var emailTextField: LoginScreenTextField!
    @IBOutlet weak var passwordTextField: LoginScreenTextField!
    @IBOutlet weak var loginBtn: ButtonPrimary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)

    }
    
    @objc func handleLogIn() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if (error == nil && user != nil) {
                print("User logged in")
                self.performSegue(withIdentifier: "toHomeScreen", sender: self)
            } else {
                print("Error loggin in: \(error!.localizedDescription)")
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser  {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }

}
