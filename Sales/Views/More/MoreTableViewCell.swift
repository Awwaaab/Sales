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
        self.layer.shadowColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 1
//
//
//        self.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 8
//        self.clipsToBounds = true

    }
    
    func handel(indexpath : IndexPath){
        moreLable.text = moreVC.MenuName[indexpath.row]
        moreImage.image = moreVC.MenuImage[indexpath.row]
    }
}
