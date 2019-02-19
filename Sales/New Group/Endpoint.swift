//
//  Endpoint.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation

protocol  EndPoint {
    var baseURL : String {get}
    var path : String {get}
    var urlParametares : [URLQueryItem] {get}
   
}

enum unsplashEndpoint  : EndPoint{
    case visit(user_id: String , number: String)
    case client(user_id: String , number: String)
    case balances(user_id: String)
    case newVisit(user_id : String)
    var baseURL : String {
        return unsplashVisits.baseurl
    }
    
    
    var path : String {
        switch self {
        case .visit : return "/visits"
        case .client : return "/clients"
        case .balances: return "/user/balance"
        case .newVisit : return "/visit/add"
        }
    }
    var urlParametares: [URLQueryItem] {
        switch self {
        case .visit(let id , let number) : return [
            URLQueryItem(name: "user_id", value: id),
            URLQueryItem(name: "number", value: number)
            ]
        case .client(let id , let number) : return [
            URLQueryItem(name: "user_id", value: id),
            URLQueryItem(name: "number", value: number)
            ]
        case .balances(let id) : return[
             URLQueryItem(name: "user_id", value: id)
            ]
        case .newVisit(let id) : return[
            URLQueryItem(name: "user_id", value: id)
            ]
        }
    }
}


extension EndPoint{
    
    var urlComponent : URLComponents {
        var urlComponent = URLComponents(string: baseURL)
        urlComponent?.path += path
        urlComponent?.queryItems = urlParametares
        
        return urlComponent!
    }
    
    var request : URLRequest{
        return URLRequest(url: urlComponent.url!)
    }

   
    
}


