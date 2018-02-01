//
//  CreateAccountVC.swift
//  Smack
//
//  Created by david.roff on 2/1/18.
//  Copyright © 2018 david.roff. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
