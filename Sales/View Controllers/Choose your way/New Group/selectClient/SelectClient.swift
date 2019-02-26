//
//  SelectClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 14/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class SelectClient: UIViewController , controllerDelegate {
   
    var ChosenCLient : String = ""
    var Controller : selectController = selectController.client
   
    
    weak var delegateClient : DelegateClient?
    
    
    
   
    func didSelectcontroller(controller: selectController) {
        Controller = controller
    }
    
    @IBOutlet weak var selectClientTableView : UITableView!
    let newVisitViewModel = NewVisitViewMode(client: unsplashNewVisit())

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
       

        newVisitViewModel.showError = { (error) in
            print(error)
        }
        newVisitViewModel.reloadData = {
            self.selectClientTableView.reloadData()
        }
        newVisitViewModel.fetchNewVisit()
       
    }

  

}


