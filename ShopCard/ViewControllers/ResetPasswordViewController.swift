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

    @IBOutlet weak var emailTxt: FloatLabelTextField!
    @IBOutlet weak var resetBtn: LinearGradientButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideError(show: false)
        
        resetBtn.addTarget(self, action: #selector(handlePasswordReset), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func handlePasswordReset() {
        guard let email = emailTxt.text else { return }

        showHideError(show: false)
        resetBtn.setTitle("Sending email...", for: .normal)

        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            self.resetBtn.setTitle("Send link", for: .normal)
            
            if (error == nil) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.performSegue(withIdentifier: "toHomeScreen", sender: self)
                }                
            } else {
                self.errorLbl.text = (error?.localizedDescription)

            }
        })
    }

    @objc func showHideError(show: Bool = false, message: String = "") {
        self.errorLbl.text = message
        self.errorLbl.isHidden = !show
    }

}
