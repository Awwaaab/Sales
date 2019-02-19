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
    
    var onlyClient : [String] = []
    var onlytype : [String] = []
    //MARK: UI
    
    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    func fetchNewVisit(){
        if let client = client as? unsplashNewVisit{
            let endpoint = unsplashEndpoint.newVisit(user_id: "2")
            client.fetechNewVisit(with: endpoint, completion: { (either) in
                switch either {
                case .success(let rootNewVisits):
                    
                    self.selectCLient = rootNewVisits.clients
                    self.selectType = rootNewVisits.types
                    for oClient in rootNewVisits.clients{
                        self.onlyClient.append(oClient.name)
                    }
                    for otype in rootNewVisits.types{
                        self.onlytype.append(otype.name)
                    }
                    print(self.onlyClient)
                   //print(self.selectCLient)
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
                
            })
        }
    }
    
    
}
