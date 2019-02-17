//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
//
//////////////sender
import UIKit

class NewVisitViewController: UIViewController , DateDelegate  {
    
    
    func didSelectDate(date: String) {
        choosedDateLabel.text = date
    }
    var toViewController : selectController = selectController.client
  
    
    
    weak var   delegate : controllerDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "GetDate"{
        let controller = segue.destination as? DatePikerViewcontroller
            controller?.delegate = self
        }
        
        if segue.identifier == "getClient" {
        let controller = segue.destination as? SelectClient
            self.delegate = controller
        }
    }
    
    
    
    @IBOutlet weak var choosedDateLabel : UILabel!
    @IBAction func getdate(_ sender:UIButton){
        performSegue(withIdentifier: "GetDate", sender: sender)
    }
    @IBAction func getClient(_ sender:UIButton){
        performSegue(withIdentifier: "getClient", sender: nil)
        toViewController = selectController.client
         delegate?.didSelectcontroller(controller: toViewController)
    }
    @IBAction func gettype(_ sender:UIButton){
        performSegue(withIdentifier: "getClient", sender: nil)
        toViewController = selectController.type
         delegate?.didSelectcontroller(controller: toViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}



