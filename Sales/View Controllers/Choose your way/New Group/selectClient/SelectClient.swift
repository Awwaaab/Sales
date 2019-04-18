//
//  SelectClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 14/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class SelectClient: UIViewController  {
   
    @IBOutlet weak var selectClientTableView : UITableView!
    @IBOutlet weak var clientsSearchBar : UISearchBar!
    var ChosenCLient : ClientsAV!
    weak var delegateClient : DelegateClient?

    let newVisitViewModel = NewVisitViewMode(client: Unsplash())

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clientsSearchBar.returnKeyType = UIReturnKeyType.done
        newVisitViewModel.showError = { (error) in
            print(error)
        }
        newVisitViewModel.reloadData = {
            self.selectClientTableView.reloadData()
        }
        newVisitViewModel.fetchNewVisit()
       
    }

}


