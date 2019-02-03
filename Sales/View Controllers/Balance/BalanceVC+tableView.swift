//
//  BalanceVC+tableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


extension BalanceVC : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balanceViewModel.Balances.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("VisitTableViewCell", owner: self, options: nil)?.first as! VisitTableViewCell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitsCellData", for: indexPath) as! VisitTableViewCell  /* if you want to use the righster nib file method*/
      cell.handleOutlets(Balance: balanceViewModel.Balances[indexPath.row])
        return cell
    }
    
    
    func handleDelegateAndDatasource(){
        balanceTabelView.delegate = self
        balanceTabelView.dataSource = self
    }
    
}
