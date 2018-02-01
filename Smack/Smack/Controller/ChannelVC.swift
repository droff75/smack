//
//  ChannelVC.swift
//  Smack
//
//  Created by david.roff on 2/1/18.
//  Copyright © 2018 david.roff. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

}
