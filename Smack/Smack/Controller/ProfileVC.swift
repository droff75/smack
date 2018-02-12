//
//  ProfileVC.swift
//  Smack
//
//  Created by david.roff on 2/6/18.
//  Copyright © 2018 david.roff. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!    
    @IBOutlet weak var userNameTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editBtnPressed(_ sender: Any) {
        userName.isHidden = true
        userNameTxtField.isHidden = false
        userNameTxtField.text = userName.text
        userNameTxtField.becomeFirstResponder()
    }
    
    @IBAction func textFieldDonePressed(_ sender: Any) {
        UserDataService.instance.updateUserName(id: UserDataService.instance.id, name: userNameTxtField.text!, completion: { (success) in
            self.userNameTxtField.isHidden = true
            self.userName.text = self.userNameTxtField.text
            self.userName.isHidden = false
            self.userNameTxtField.resignFirstResponder()
            UserDataService.instance.changeUserName(userName: self.userName.text!)
            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        })
    }
    
    func setUpView() {
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        userNameTxtField.isHidden = true
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
