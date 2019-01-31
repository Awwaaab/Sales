//
//  BalanceVC.swift
//  Sales
//
//  Created by Awab Aly-mac on 30/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class BalanceVC: UIViewController {

    @IBOutlet weak var MainScrollView: UIScrollView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var balanceTabelView: UITableView!
    @IBOutlet weak var noOfBalance: UILabel!
    
    let balanceViewModel = BalanceViewModel(client: unsplashBalance())
    
    override func viewDidLoad() {
       super.viewDidLoad()
       balanceTabelView.handlAnimation(animationIsOn: true, activityIndicator: activityIndicatorView,scrolView :MainScrollView)
        balanceViewModel.showError = { error in
            print(error)

        }
//
        balanceViewModel.reloadData = {
  
            self.balanceTabelView.handlAnimation(animationIsOn: false, activityIndicator: self.activityIndicatorView,scrolView : self.MainScrollView)
            self.noOfBalance.text = self.balanceViewModel.Balance
            }
//
        balanceViewModel.fetchBalance()
        
    }



}
