//
//  unsplashClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation

class  unsplashVisits : APIClient{
    static let baseurl = "http://hyper-design.com/NewSales/api"
    
    func fetechVisits(with Endpoint : EndPoint , completion : @escaping (Either<visitRoot>)-> Void){
      var request = Endpoint.request
        request.httpMethod = "POST"
        get(request: request, completion: completion)
    }
   
}

