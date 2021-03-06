//
//  SelectClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 14/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


class SelectClient: UIViewController  {
    
    
    
    
    @IBOutlet weak var selectClientTableView : UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var clientsSearchBar : UISearchBar!
    
    
    var ChosenCLient : ClientsAV!
    let reportsInstance = Reports()
    weak var delegateClient : DelegateClient?
    let newVisitViewModel = NewVisitViewMode(client: Unsplash())
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clientsSearchBar.returnKeyType = UIReturnKeyType.done
        
        self.selectClientTableView.handlActivityIndicatorWithTableView(animationIsOn: true, activityIndicator: activityIndicator, scrolView: nil)
        
       
        
            
       
       newVisitViewModel.showError = { (error) in
            print("==================================\(error)=================================")
            self.showAlertController(alerTitle: "Network error", alertMessage: "Hmmm. seems that you are not connected", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
                
            })
            
        }
        newVisitViewModel.reloadData = {
            self.selectClientTableView.reloadData()
            self.selectClientTableView.handlActivityIndicatorWithTableView(animationIsOn: false, activityIndicator: self.activityIndicator, scrolView: nil)
            self.activityIndicator.isHidden = true
        }
        newVisitViewModel.fetchNewVisit()
        
    }
    
}


