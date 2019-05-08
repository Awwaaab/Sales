//
//  VisitsVC.swift
//  Sales
//
//  Created by Awab Aly-mac on 1/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class VisitsVC: UIViewController {
    
   
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var VisitsTableView: UITableView!
 
    let VisitViewModel = VisitViewMode(client: Unsplash())
    
    var something : [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
           
            VisitsTableView.handlActivityIndicatorWithTableView(animationIsOn: true, activityIndicator: activityIndicatorView,scrolView :nil)
            VisitViewModel.showError = { (error) in
              print("==================================\(error)========\(error.localizedDescription)=========================" )
                self.showAlertController(alerTitle: "Network error", alertMessage: "Hmmm. seems that you are not connected", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                    self.tabBarController?.selectedIndex=0
                    
                })
                
            }
            
            VisitViewModel.reloadData = {
                
                self.VisitsTableView.handlActivityIndicatorWithTableView(animationIsOn: false, activityIndicator: self.activityIndicatorView,scrolView : nil)
            }
            
            VisitViewModel.fetchVisits()
            
      
    }
}

