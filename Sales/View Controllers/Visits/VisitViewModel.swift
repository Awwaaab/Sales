//
//  VisitViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import UIKit



class VisitViewMode {
    
    
    //MARK: properties
  private var client : APIClient
     var visits : [Visit] = []
  
    //MARK: UI

    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    func fetchVisits(){
        if let client = client as? Unsplash{
            let endpoint = unsplashEndpoint.visit(user_id: CustomUserDefaults.userID, number: "0")
            client.fetechClients(with: endpoint, completion: { (either : Either<visitRoot>) in
                switch either {
                case .success(let rootVisits):
                    self.visits = rootVisits.visits
                    print(self.visits)
                self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
            })
        }
    }
    
    

    
    
}
