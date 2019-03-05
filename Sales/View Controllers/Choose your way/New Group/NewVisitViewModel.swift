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
    var currentCLient : [ClientsAV] = []
    var selectType : [TypesAV] = []
    
// geting the type , Purpose in array to put it into a picker view
    var onlytype : [String] = []
    var dedupetype : [String] = []
    var onlyPurpose : [String] = []
    var dedupePurpose : [String] = []
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
        if let client = client as? unsplashNewVisit{
            let endpoint = unsplashEndpoint.newVisit(user_id: "2")
            client.fetechNewVisit(with: endpoint, completion: { (either) in
                switch either {
                case .success(let rootNewVisits):
                    
                    self.selectCLient = rootNewVisits.clients
                    self.currentCLient =  rootNewVisits.clients
                    for otype in rootNewVisits.types{
                        self.onlytype.append(otype.name)
                    }
                    for opurpose in rootNewVisits.purposes{
                        self.onlyPurpose.append(opurpose.name)
                    }
                   
                     self.dedupetype = self.removeDuplicates(array: self.onlytype)
                    self.dedupePurpose = self.removeDuplicates(array: self.onlyPurpose)
                
                    
                    
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
                
            })
        }
    }
    
    
}
