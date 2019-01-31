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
 
    let VisitViewModel = VisitViewMode(client: unsplashVisits())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       VisitsTableView.handlAnimation(animationIsOn: true, activityIndicator: activityIndicatorView,scrolView :nil)
        VisitViewModel.showError = { error in
            print(error)
            
        }
        
        VisitViewModel.reloadData = {
         
            self.VisitsTableView.handlAnimation(animationIsOn: false, activityIndicator: self.activityIndicatorView,scrolView :nil)
        }
        
        VisitViewModel.fetchVisits()
        
    }
    
    
}

