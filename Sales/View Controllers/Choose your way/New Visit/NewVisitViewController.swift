//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class NewVisitViewController: UIViewController {

   
    @IBAction func getdate(_ sender:UIButton){
     performSegue(withIdentifier: "GetDate", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
    }


   
}
