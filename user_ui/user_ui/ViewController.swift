//
//  ViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 25.12.2019.
//  Copyright © 2019 Павел Чернышев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func enterTap(_ sender: Any) {
        let login = loginTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        print("login: " + login + " password: " + pass)
    }
}

