//
//  addVisit.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


struct AddVisitRoot : Codable{
    var sales : salesAV
    var clients : [ClientsAV]
    var types : [TypesAV]
    var purposes : [PurposesAV]
}

//AV stands for Add Visit API

struct salesAV : Codable {
    let id : Int
    let name : String
}
struct ClientsAV : Codable {
    let id : Int
    let name : String
}

struct TypesAV : Codable{
   let id : Int
   let name : String
    let status: String
}


struct PurposesAV : Codable {
    let id : Int
    let name : String
    let type : String
    let status :String
}

