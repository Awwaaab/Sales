//
//  SelectCategoryOrCityOrCountry.swift
//  Sales
//
//  Created by Awab Aly-mac on 21/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class SelectCategoryOrCityOrCountry: UIViewController , SelectorDelegate{

    

    var toSelector : SelectorType!
    
    func MoveSelector(Selector: SelectorType) {
        toSelector  = Selector
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

       print(toSelector)
    }

    
}
