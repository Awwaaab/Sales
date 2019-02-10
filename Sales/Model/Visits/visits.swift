 //
//  Model.swift
//  Sales
//
//  Created by Awab Aly-mac on 2/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import Foundation

 struct visitRoot : Codable{
    var visits : [Visit]
 }

//typealias Visits = [Visit]
 
struct Visit : Codable {
    let id: Int
    let sale_name: String
    let client_name: String
    let type_name: String
    let purpose_name: String
    let date_time: String
    let comment: String
    let admin_comment: String
    let commission: String
    let value: String
    let status: String
    let lat: String
    let long: String
    let visit_value: String

}

