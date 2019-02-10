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
    
    //  var clientsDataArray = [Clients]()
    var FilteredData = [Clients]()
    var isSearching = false
    
    let clientViewModel = ClientViewMode(client: unsplashClients())
    
    @IBOutlet weak var clientsSearchBar: UISearchBar!
    @IBOutlet weak var clientsTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var TableViewTopConstran: NSLayoutConstraint!
    @IBAction func searchButton(_ sender: UIButton) {
        
        if clientsSearchBar.isHidden == true {
            self.clientsSearchBar.isHidden = false
            self.TableViewTopConstran.constant = 54
            
        } else {
            clientsSearchBar.isHidden = true
            TableViewTopConstran.constant = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clientsSearchBar.isHidden = true
        handlingSearchBarDelegateAndKeytype()
        handlingTableViewDelegateAndDatasource()
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

