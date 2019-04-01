//
//  unsplashAddVisit.swift
//  Sales
//
//  Created by Awab Aly-mac on 11/3/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation


class  unsplashAddVisit : APIClient{
    static let baseurl = "http://hyper-design.com/NewSales/api"
    
    
    func fetchAddVisit(with Endpoint : EndPoint , completion : @escaping (Either<AddVisitMessage>)-> Void){
        var request = Endpoint.request
        request.httpMethod = "POST"
        get(request: request, completion: completion)
    }
}


