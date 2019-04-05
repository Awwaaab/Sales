//
//  ChooseYourWay.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class ChooseYourWay: UIViewController {

     let signInViewModel = SingInViewModel(client: unsplash())
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func NewVisit(_ sender : UIButton){

      performSegue(withIdentifier: "GoToNewVisit", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        signInViewModel.singIn = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
