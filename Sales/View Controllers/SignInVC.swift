//
//  ViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 29/11/18.
//  Copyright © 2018 Awab Aly-mac. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UILabel!
    @IBAction func signInButton(_ sender: UIButton) {
        print("user name : \(String(describing: loginEmailTextField?.text))" )
        print("user name : \(String(describing: loginPasswordTextField?.text))" ) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
      

    

    }

}

