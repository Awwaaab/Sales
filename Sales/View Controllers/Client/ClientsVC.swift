//
//  ClientsVC.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class ClientsVC: UIViewController {

    var clientsDataArray = [Clients]()
    
    let clientViewModel = ClientViewMode(client: unsplashClients())
    
    @IBOutlet weak var clientsTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        clientsTableView.handlAnimation(animationIsOn: true, activityIndicator: activityIndicatorView,scrolView :nil)
        
        clientViewModel.showError = { (error) in
                print(error)
        }
        clientViewModel.reloadData = {
           
            self.clientsTableView.handlAnimation(animationIsOn: false, activityIndicator: self.activityIndicatorView,scrolView :nil)
        }
        clientViewModel.fetchclients()
        
    }
    
    

}

