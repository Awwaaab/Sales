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
    //AV means add visit
    var selectCLient : [ClientsAV] = []
    var currentCLient : [ClientsAV] = []
    var selectType : [TypesAV] = []
    var selectPurpose : [PurposesAV] = []
  
    
    
 
    //MARK: UI
    
    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                
            }
            else {
                encountered.insert(value)
                result.append(value)
            }
        }
        return result
    }
    
    
    
    func fetchNewVisit(){
        if let client = client as? Unsplash{
            let endpoint = unsplashEndpoint.newVisit(user_id: CustomUserDefaults.userID)
            client.fetechClients(with: endpoint, completion: { (either : Either<AddVisitRoot>) in
                switch either {
                case .success(let rootNewVisits):
                    
                    self.selectCLient = rootNewVisits.clients
//                   print(self.selectCLient)
                    self.currentCLient =  rootNewVisits.clients
                    self.selectType = rootNewVisits.types
                     self.selectPurpose = rootNewVisits.purposes
                    print(self.selectType)
                    print("should be selected pupose object here:\(self.selectPurpose)")
      
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
                
            })
        }
    }
    
    
}

