//
//  PickerViewShadow.swift
//  Sales
//
//  Created by Awab Aly-mac on 21/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class PickerViewShadow: UIPickerView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 27
        self.clipsToBounds = true
    }

}
