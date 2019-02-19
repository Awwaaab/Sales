//
//  unsplashNewVisit.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation


class  unsplashNewVisit : APIClient{
    static let baseurl = "http://hyper-design.com/NewSales/api"
    
    
    func fetechNewVisit(with Endpoint : EndPoint , completion : @escaping (Either<AddVisitRoot>)-> Void){
        var request = Endpoint.request
        request.httpMethod = "POST"
        get(request: request, completion: completion)
    }
}


