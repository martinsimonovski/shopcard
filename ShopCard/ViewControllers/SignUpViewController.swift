//
//  SignUpViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/23/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTxt: FloatLabelTextField!
    @IBOutlet weak var emailTxt: FloatLabelTextField!
    @IBOutlet weak var passwordTxt: FloatLabelTextField!
    @IBOutlet weak var repeatPasswordTxt: FloatLabelTextField!
    @IBOutlet weak var signupBtn: LinearGradientButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)

        // Do any additional setup after loading the view.
        signupBtn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func handleSignUp() {
        guard let username = usernameTxt.text else {
            self.showHideError(show: true, message: "Please insert username")
            return
        }
        guard let email = emailTxt.text else {
            self.showHideError(show: true, message: "Please insert email")
            return
        }
        guard let password = passwordTxt.text else {
            self.showHideError(show: true, message: "Please insert password")
            return
        }
        guard let repeatPassword = repeatPasswordTxt.text else {
            self.showHideError(show: true, message: "Please repeat the password")
            return
        }
        
        if (password != repeatPassword) {
            self.showHideError(show: true, message: "The passwords don't match.")
            return
        }
        
        showHideError(show: false)
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if (error == nil && user != nil ) {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges { error in
                    if (error == nil) {
                        print("User display name changed!");
                        self.performSegue(withIdentifier: "toHomeScreen", sender: self)
                    }
                }
            } else {
                print("Error creating user: \(error!.localizedDescription)")
                self.showHideError(show: true, message: error!.localizedDescription)
            }
        }
    }
    
    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
