//
//  BalanceViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import UIKit



class BalanceViewModel {
    
    
    //MARK: properties
  private var client : APIClient
     var Balances : [Balances] = []
     var Balance : String = ""

    //MARK: UI

    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    func fetchBalance(){
        if let client = client as? unsplash{
            let endpoint = unsplashEndpoint.balances(user_id: "2")
            client.fetechClients(with: endpoint, completion: { (either : Either<balanceRoot>) in
                switch either {
                case .success(let rootBalance):
                    self.Balances = rootBalance.balances
                    self.Balance = rootBalance.balance
                    print( self.Balances)
                 //    print( self.Balance)
                self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
               
            })
        }
    }
    
}
