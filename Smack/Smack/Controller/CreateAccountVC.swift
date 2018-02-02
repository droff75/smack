//
//  CreateAccountVC.swift
//  Smack
//
//  Created by david.roff on 2/1/18.
//  Copyright © 2018 david.roff. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("registered user!")
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
}
