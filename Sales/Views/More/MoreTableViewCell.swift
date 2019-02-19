//
//  MoreTableViewCell.swift
//  Sales
//
//  Created by Awab Aly-mac on 3/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

   
    @IBOutlet weak var moreLable: UILabel!
    @IBOutlet weak var moreImage: UIImageView!
    
   let moreVC = MoreVC()

    override func awakeFromNib() {
        super.awakeFromNib()
      
        
        self.layer.setShadows(shadowColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1), shadowOpacity: 0.9, shadowOffset: CGSize(width: 0, height: 1.0), shadowRadius: 1)
        
    }
    
    func handel(indexpath : IndexPath){
        moreLable.text = moreVC.MenuName[indexpath.row]
        moreImage.image = moreVC.MenuImage[indexpath.row]
    }
}

