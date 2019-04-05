//
//  signIn.swift
//  Sales
//
//  Created by Awab Aly-mac on 2/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation



struct UserRoot : Codable {
    var user : User
}


struct User : Codable {
    let id : Int
    let name : String
    let email : String
    let role : String
    
}
