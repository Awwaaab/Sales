//
//  ChooseYourWay.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class ChooseYourWay: UIViewController {

     let signInViewModel = SingInViewModel(client: Unsplash())
    
    var userInfo : User?
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
      
      
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "logInNavigationController")
            self.show(controller, sender: self)
        
      UserDefaults.standard.setLoggedIn(value: false)
    }
    
    
    @IBAction func NewVisit(_ sender : UIButton){

      performSegue(withIdentifier: "GoToNewVisit", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("THIS IS WHAT YOU WANT :\(userInfo?.id ?? 0)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
