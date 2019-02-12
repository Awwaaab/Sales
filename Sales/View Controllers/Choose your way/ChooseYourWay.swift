//
//  ChooseYourWay.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class ChooseYourWay: UIViewController {

    
    @IBAction func NewVisit(_ sender : UIButton){
//        let storyBord = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyBord.instantiateViewController(withIdentifier: "NewVisitID")
//        self.navigationController?.pushViewController(controller, animated: true)
      performSegue(withIdentifier: "GoToNewVisit", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
