//
//  DelegateProtocol.swift
//  Sales
//
//  Created by Awab Aly-mac on 13/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


protocol controllerDelegate :  NSObjectProtocol{
    func didSelectcontroller(controller : selectController)
}

protocol DelegateClient : NSObjectProtocol{
    func moveData(data : String)
}

//
//enum selectController {
//    case client , type , purposes
//}

