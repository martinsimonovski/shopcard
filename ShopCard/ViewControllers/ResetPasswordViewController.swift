//
//  ResetPasswordViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 6/23/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

//    @IBOutlet weak var emailTextField: UITextField!
//    @IBOutlet weak var resetPasswrodBtn: UIButton!
//    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)
        
//        resetPasswrodBtn.addTarget(self, action: #selector(handlePasswordReset), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func handlePasswordReset() {
//        guard let email = emailTextField.text else { return }
//        
//        showHideError(show: false)
//        resetPasswrodBtn.setTitle("Sending email...", for: .normal)
//        
//        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
//            if (error == nil) {
//                self.dismiss(animated: false, completion: nil)
//            } else {
//                self.errorLbl.text = (error?.localizedDescription)
//            }
//        })
    }

    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
