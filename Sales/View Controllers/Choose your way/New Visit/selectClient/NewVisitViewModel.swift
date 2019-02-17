//
//  NewVisitViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation


class NewVisitViewMode {
    
    
    //MARK: properties
    private var client : APIClient
    
    var selectCLient : [ClientsAV] = []
    var selectType : [TypesAV] = []
    //MARK: UI
    
    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    func NewVisit(){
        if let client = client as? unsplashNewVisit{
            let endpoint = unsplashEndpoint.newVisit(user_id: "2")
            client.fetechNewVisit(with: endpoint, completion: { (either) in
                switch either {
                case .success(let rootNewVisits):
                    self.selectCLient = rootNewVisits.clients
                    self.selectType = rootNewVisits.types
                   print(self.selectCLient)
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
                
            })
        }
    }
    
    
    
    
    
}
