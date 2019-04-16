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
    
    
    
    
    
    
    func fetchAddVisit()
//        (saleId: String , clientId:String , type : String , purpose : String , purposValue : String , comment : String , longtitde : String , latidue : String)
    {
        if let client = client as? unsplash{
            let endPoint = unsplashEndpoint.addVisit(sale: userID, client: "4", type: "5", purpose: "2", purpose_value: "123", comment: "cghjcgh xdfgdfg ghfxhgfhfx xfdgxdfg", longitude: "30.001973999999997", latitude: "31.170903799999998")
//            let endPoint = unsplashEndpoint.addVisit(sale: saleId, client: clientId, type: type, purpose: purpose , purpose_value: purposValue, comment:purposValue, longitude: longtitde, latitude: latidue) 
            client.fetechClients(with: endPoint, completion: { (either : Either<AddVisitMessage>) in
                switch either {
                case .success(let rootNewVisits):
                    self.selectCLient = rootNewVisits.message
                    print(self.selectCLient , self.userID)
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
                
            })
        }
    }
    
    
}
