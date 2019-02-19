//
//  unsplashClients.swift
//  Sales
//
//  Created by Awab Aly-mac on 27/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import Foundation

class  unsplashClients : APIClient{
    static let baseurl = "http://hyper-design.com/NewSales/api"
    
    
    func fetechClients(with Endpoint : EndPoint , completion : @escaping (Either<clientsRoot>)-> Void){
        var request = Endpoint.request
        request.httpMethod = "POST"
        get(request: request, completion: completion)
    }
}


