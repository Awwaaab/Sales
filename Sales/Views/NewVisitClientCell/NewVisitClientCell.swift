//
//  NewVisitClientCell.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class NewVisitClientCell: UITableViewCell {

    
    @IBOutlet weak var clientLabel: UILabel!
    
    
    func handleLabel(clientAV : ClientsAV){
        clientLabel.attributedText = NSAttributedString(string : clientAV.name)
    }
    func handleLabel(typeAV : TypesAV){
        clientLabel.attributedText = NSAttributedString(string : typeAV.name)
    }
    
}
