//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
//

import UIKit

class NewVisitViewController: UIViewController , DateDelegate {
    
    func didSelectDate(date: String) {
        choosedDateLabel.text = date
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? DatePikerViewcontroller
        if segue.identifier == "GetDate"{
            controller?.delegate = self
        }
    }
    @IBOutlet weak var choosedDateLabel : UILabel!
    @IBAction func getdate(_ sender:UIButton){
        performSegue(withIdentifier: "GetDate", sender: sender)
    }
    @IBAction func getClient(_ sender:UIButton){
        performSegue(withIdentifier: "getClient", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}



