//
//  SelectClient+TableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 26/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
extension SelectClient : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newVisitViewModel.currentCLient.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewVisitClientCell", owner: self, options: nil)?.first as! NewVisitClientCell
            cell.handleLabel(clientAV: newVisitViewModel.currentCLient[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ChosenCLient = newVisitViewModel.currentCLient[indexPath.row].name
        delegateClient?.moveData(data: ChosenCLient)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension SelectClient : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        newVisitViewModel.currentCLient = newVisitViewModel.selectCLient.filter({ (client) -> Bool in
            if searchText.isEmpty {return true}
            return client.name.lowercased().contains(searchText.lowercased())
        })
        self.selectClientTableView.reloadData()
    }
}

