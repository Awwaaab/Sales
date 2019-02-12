//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

import UIKit

class NewVisitViewController: UIViewController , DateDelegate{
    
    
    
    
    func didSelectDate(date: String) {
        label.text = date
    }
   
    @IBOutlet weak var label : UILabel!
    @IBAction func getdate(_ sender:UIButton){
        performSegue(withIdentifier: "GetDate", sender: sender)
        
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GetDate"{
            let contrroller = segue.destination as? DatePikerViewcontroller
            contrroller?.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}

