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

    @IBOutlet weak var usernameTextField: LoginScreenTextField!
    @IBOutlet weak var emailTextField: LoginScreenTextField!
    @IBOutlet weak var passwordTextField: LoginScreenTextField!
    @IBOutlet weak var signUpBtn: ButtonPrimary!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signUpBtn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        showHideError(show: false)
    }
    
    /**
      Enables or disables the signUpBtn
    */
    func setSignUpBtn(enabled: Bool) {
        if (enabled) {
            signUpBtn.alpha = 1.0
            signUpBtn.isEnabled = true
        } else {
            signUpBtn.alpha = 0.5
            signUpBtn.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        guard let username = usernameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        setSignUpBtn(enabled: false)
        showHideError(show: false)
        
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if (error == nil && user != nil ) {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges { error in
                    if (error == nil) {
                        print("User display name changed!");
                        self.dismiss(animated: false, completion: nil)
                    }
                }
            } else {
                print("Error creating user: \(error!.localizedDescription)")
                self.showHideError(show: true, message: error!.localizedDescription)
            }
        }
        
//        if (emailTextField.text == "") {
//            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle:.alert)
//            
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            
//            present(alertController, animated: true, completion: nil)
//        } else {
//            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//                if (error == nil) {
//                    print ("You have successfully signed up")
//                    
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
//                } else {
//                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                    
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    
//                    self.present(alertController, animated: true, completion: nil)
//                }
//            }
//        }
    }
    
    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
