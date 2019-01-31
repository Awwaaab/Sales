//
//  APIClient.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation


enum Either<T>{ // an enum with type "T"
    case success(T)
    case error(Error) // the error protocol
}


enum APIError : Error{
    case badresponse , decodingError , unknown
}



protocol APIClient{
   var session : URLSession {get} /* the object we use to creat network request */
    func get<T : Codable>(request : URLRequest, completion: @escaping (Either<T>) -> Void)
    /*this method to retrive our data from unsplash*/
}

extension APIClient{
    var session: URLSession {
        return URLSession.shared
    }
    
    func get<T : Codable>(request : URLRequest, completion: @escaping (Either<T>)->Void){
        let task = session.dataTask(with: request) { (data, response, error) in
//            let _ = String(data : data!,encoding : .utf8)
          
            guard error == nil else{
                completion(Either.error(error!))
                return
            }
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else{
                completion(Either.error(APIError.badresponse))
                return
            }
            guard let value = try? JSONDecoder().decode(T.self, from:data!) else{
                completion(Either.error(APIError.decodingError))
                return
            }
            DispatchQueue.main.async {
                completion(Either.success(value))
            }
            
        }
        task.resume()
    }
}





