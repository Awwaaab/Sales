//
//  AddVisitViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 10/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation

class AddVisitViewMode {
    
    
    //MARK: properties
     var client : APIClient
    
    var selectCLient : String = ""
    
    //MARK: UI
    
    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    var userID = UserDefaults.standard.value(forKey: UserDefaultsKeys.userID.rawValue) as! String
    
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    
    
    
    
    func fetchAddVisit(clientId:String , purposValue : String  , type : String , purpose : String , comment : String , longtitde : String , latitude : String){
        if let client = client as? unsplash{
            let endPoint = unsplashEndpoint.addVisit(sale: userID, client: clientId, type: type, purpose: purpose, purpose_value: purposValue, comment: comment, longitude: longtitde, latitude: latitude)

            client.fetechClients(with: endPoint, completion: { (either : Either<AddVisitMessage>) in
                switch either {
                case .success(let rootNewVisits):
                    self.selectCLient = rootNewVisits.message
                    print(self.selectCLient , self.userID , clientId , longtitde , latitude , comment , purposValue , type , purpose)
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
                
            })
        }
    }
    
    
}
