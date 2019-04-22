//
//  Reborts+TableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 22/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

extension Reports : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportsViewModel.visits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("VisitTableViewCell", owner: self, options: nil)?.first as! VisitTableViewCell

        cell.handleOutlets(VisitData: reportsViewModel.visits[indexPath.row])
        return cell
    }

    
    func handleDelegateAndDatasource(){
        AfterFilterTableView.delegate = self
        AfterFilterTableView.dataSource = self
    }
}
