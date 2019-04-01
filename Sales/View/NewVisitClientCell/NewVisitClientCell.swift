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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.setShadows(shadowColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1), shadowOpacity: 0.9, shadowOffset: CGSize(width: 0, height: 1.0), shadowRadius: 1)
    }
    
    
    func handleLabel(clientAV : ClientsAV){
        clientLabel.attributedText = NSAttributedString(string : clientAV.name)
    }
    func handleLabel(typeAV : TypesAV){
        clientLabel.attributedText = NSAttributedString(string : typeAV.name)
    }
    
  
}
