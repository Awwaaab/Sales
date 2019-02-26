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
            return newVisitViewModel.selectCLient.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewVisitClientCell", owner: self, options: nil)?.first as! NewVisitClientCell
            cell.handleLabel(clientAV: newVisitViewModel.selectCLient[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ChosenCLient = newVisitViewModel.selectCLient[indexPath.row].name
        delegateClient?.moveData(data: ChosenCLient)
        self.navigationController?.popViewController(animated: true)
    }
    
}
//
//extension SelectClient : UISearchBarDelegate {
//    override func didChangeValue(forKey key: String) {
//        <#code#>
//    }
//}

