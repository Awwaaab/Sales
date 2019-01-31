//
//  Balace.swift
//  Sales
//
//  Created by Awab Aly-mac on 30/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation

struct balanceRoot : Codable {
    var balance : String
    var balances : [Balances]
}


struct Balances : Codable {
    var id : Int
    var sale_name : String
    var visit_id : Int
    var date: String
    var value : String
    
}



