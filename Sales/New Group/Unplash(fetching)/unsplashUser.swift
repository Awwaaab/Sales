//
//  unsplashUser.swift
//  Sales
//
//  Created by Awab Aly-mac on 2/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import Foundation

class  unsplashUser : APIClient{
    static let baseurl = "http://hyper-design.com/NewSales/api"
    
    func fetechUser(with Endpoint : EndPoint , completion : @escaping (Either<User>)-> Void){
        var request = Endpoint.request
        request.httpMethod = "POST"
        get(request: request, completion: completion)
    }
    
}
