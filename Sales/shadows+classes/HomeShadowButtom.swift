//
//  HomeShadowButtom.swift
//  Sales
//
//  Created by Awab Aly-mac on 1/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
class HomeShadowButtom: UIView {
   
    
    override func awakeFromNib() {
        super .awakeFromNib()
        self.layer.setShadows(shadowColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), shadowOpacity: 0.5, shadowOffset: CGSize(width: 0, height: 3.0), shadowRadius: 3)
       
    }

}
