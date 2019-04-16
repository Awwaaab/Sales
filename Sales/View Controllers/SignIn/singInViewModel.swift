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
    
    var shouldSingIn : Bool = false
    var showError : ((Error) -> Void)?
    var perfromSingIn : (() -> Void)?
    init(client : APIClient) {
        self.client = client
    }
   
    
    
    func fetchUser(email : String, passowrd : String){
        if let client = client as? unsplash{
//             let adminEndpoint = unsplashEndpoint.user(email: "info@hyper-design.com" ,password: "123456")
              let endpoint = unsplashEndpoint.user(email: email ,password: passowrd)
            client.fetechClients(with: endpoint, completion: { (either : Either<UserRoot>) in
                switch either {
                case .success(let rootUser):
                    self.userInfo = rootUser.user
//                    print("HERE WE ARE :))))))    \(self.userInfo)")
                    UserDefaults.standard.setUserID(ID: String(self.userInfo.id) )
                    self.perfromSingIn?()
                case .error(let error):
                    self.showError!(error)
                  self.shouldSingIn = false
                }
                
            })
        }
    }
    
    
    
    
    
}


