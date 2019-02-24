//
//  SelectClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 14/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class SelectClient: UIViewController , controllerDelegate {
   
    var ChosenCLient : String = ""
    var Controller : selectController = selectController.client
   
    
    weak var delegateClient : DelegateClient?
    func didSelectcontroller(controller: selectController) {
        Controller = controller
    }
    
    @IBOutlet weak var selectClientTableView : UITableView!
    let newVisitViewModel = NewVisitViewMode(client: unsplashNewVisit())

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     

        newVisitViewModel.showError = { (error) in
            print(error)
        }
        newVisitViewModel.reloadData = {
            self.selectClientTableView.reloadData()
        }
        newVisitViewModel.fetchNewVisit()
       
    }

  

}

extension SelectClient : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Controller == selectController.client{
             return newVisitViewModel.selectCLient.count
        }
        else {
           return newVisitViewModel.selectType.count
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewVisitClientCell", owner: self, options: nil)?.first as! NewVisitClientCell
        if Controller == selectController.client{
            cell.handleLabel(clientAV: newVisitViewModel.selectCLient[indexPath.row])
        }else if Controller == selectController.type{
            cell.handleLabel(typeAV : newVisitViewModel.selectType[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ChosenCLient = newVisitViewModel.selectCLient[indexPath.row].name
       
    }
}
