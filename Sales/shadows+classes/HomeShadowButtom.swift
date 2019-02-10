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
        self.layer.shadowColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.layer.shadowRadius = 3
    }

}
