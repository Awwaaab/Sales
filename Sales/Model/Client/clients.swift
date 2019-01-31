//
//  clientsModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation


class clientsRoot : Codable{
    var clients : [Clients]
}


struct Clients : Codable{
var id : Int
var name :String
var phone :String
var phone2 :String
var email :String
var address :String
var img :String
var region :String
var area :String
var category :String
var sale :String
}
