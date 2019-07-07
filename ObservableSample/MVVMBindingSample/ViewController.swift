//
//  ViewController.swift
//  MVVMBindingSample
//
//  Created by Dario on 7/4/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        username.bind(to: user.name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.user.name.value = "Bilbo the Hobbit"
        }
    }
    
    @IBOutlet weak var username: BoundedTextField!
    var user = User( name: Observable("Dario DelTemple") )
}

