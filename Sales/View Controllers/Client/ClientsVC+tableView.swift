//
//  ClientsVC+tableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


extension ClientsVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return FilteredData.count
        }
        
        return  clientViewModel.clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("VisitTableViewCell", owner: self, options: nil)?.first as! VisitTableViewCell
        
        if isSearching{
            cell.handleOutlets(ClientsData: FilteredData[indexPath.row])
        } else {
        cell.handleOutlets(ClientsData:  clientViewModel.clients[indexPath.row])
        }
        
        return cell
    }
    
    
    func handlingTableViewDelegateAndDatasource(){
        clientsTableView.delegate = self
        clientsTableView.dataSource = self
    }
    
}


extension ClientsVC :  UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            clientsTableView.reloadData()
        }else{
            isSearching = true
            FilteredData = clientViewModel.clients.filter({$0.name.contains(searchText)})
            clientsTableView.reloadData()
        }
    }
    
    func handlingSearchBarDelegateAndKeytype(){
        clientsSearchBar.delegate = self
        clientsSearchBar.returnKeyType = UIReturnKeyType.done
    }
    
}
