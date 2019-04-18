//
//  VisitViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import UIKit



class ClientViewMode {
    
    
    //MARK: properties
  private var client : APIClient
     var clients : [Clients] = []
    var onlyClient : [String] = []

    //MARK: UI

    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    func fetchclients(){
        if let client = client as? Unsplash{
            let endpoint = unsplashEndpoint.client(user_id: CustomUserDefaults.userID, number: "0")
            client.fetechClients(with: endpoint, completion: { (either : Either<clientsRoot>) in
                switch either {
                case .success(let clientRoot):
                   self.clients = clientRoot.clients
                   for oclient in clientRoot.clients{
                    self.onlyClient.append(oclient.name)
                   }
                    print(self.clients)
                self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
               
            })
        }
    }
    
    
}
