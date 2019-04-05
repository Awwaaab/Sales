//
//  singInViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 2/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import UIKit



class SingInViewModel {
    
    
    //MARK: properties
    private var client : APIClient
    var userInfo :User!
   
    
    //MARK: UI
    
    var singIn : Bool = false
    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    init(client : APIClient) {
        self.client = client
    }
   
    
    
    func fetchUser(email : String, passowrd : String){
        if let client = client as? unsplash{
//             let _ = unsplashEndpoint.user(email: "info@hyper-design.com" ,password: "23456")
              let endpoint = unsplashEndpoint.user(email: email ,password: passowrd)
            client.fetechClients(with: endpoint, completion: { (either : Either<UserRoot>) in
                switch either {
                case .success(let rootVisits):
                    self.userInfo = rootVisits.user
                    print(self.userInfo)
                    self.singIn = true
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                  self.singIn = false
                    
                }
                
            })
        }
    }
    
    
    
    
    
}


