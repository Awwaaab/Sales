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
    
    @IBOutlet weak var balanceTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var MainScrollView: UIScrollView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var balanceTabelView: UITableView!
    @IBOutlet weak var noOfBalance: UILabel!
    
    let balanceViewModel = BalanceViewModel(client: Unsplash())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        balanceTabelView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        handleDelegateAndDatasource()
        balanceTabelView.handlAnimation(animationIsOn: true, activityIndicator: activityIndicatorView,scrolView :MainScrollView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        balanceViewModel.showError = { (error) in
            print("==================================\(error)=================================")
            self.showAlertController(alerTitle: "Network error", alertMessage: error.localizedDescription, alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                self.tabBarController?.selectedIndex=0
                
            })
            
        }
        balanceViewModel.reloadData = {
            self.balanceTabelView.handlAnimation(animationIsOn: false, activityIndicator: self.activityIndicatorView,scrolView : self.MainScrollView)
            self.noOfBalance.text = self.balanceViewModel.Balance
        }
        balanceViewModel.fetchBalance()
    }
    
//    deinit {
//        balanceTabelView.removeObserver(self, forKeyPath: "contentSize")
//    }
    // you can use this peace of code to do the remivew
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            balanceTabelView.removeObserver(self, forKeyPath: "contentSize")
        }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView{
            if obj == self.balanceTabelView && keyPath == "contentSize" {
                balanceTableViewHeight.constant = balanceTabelView.contentSize.height
            }
        }
    }
    
}
