//
//  MoreVC+TableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 3/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

extension MoreVC : UITableViewDataSource , UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = Bundle.main.loadNibNamed("MoreTableViewCell", owner: self, options: nil)?.first as! MoreTableViewCell
        cell.handel(indexpath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }


    func handelDelegateAndDataSource(){
        MenuTableView.delegate = self
        MenuTableView.dataSource = self
    }
    
}

