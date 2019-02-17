//
//  SelectClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 14/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class SelectClient: UIViewController {

    @IBOutlet weak var selectClientTableView : UITableView!
    let clientViewModel = ClientViewMode(client: unsplashClients())

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clientViewModel.showError = { (error) in
            print(error)
        }
        clientViewModel.reloadData = {
            
        }
    clientViewModel.fetchclients()
        
    }

  

}

extension SelectClient : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectClientCell")
        cell?.textLabel?.text = "hello"
        return cell!
    }
}
