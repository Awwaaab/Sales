//
//  ClientsVC+tableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


extension ClientsVC : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  clientViewModel.clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("VisitTableViewCell", owner: self, options: nil)?.first as! VisitTableViewCell
        cell.handleOutlets(ClientsData:  clientViewModel.clients[indexPath.row])
        return cell
        
    }
    func handleDelegateAndDatasource(){
        clientsTableView.delegate = self
        clientsTableView.dataSource = self
    }
    
}


