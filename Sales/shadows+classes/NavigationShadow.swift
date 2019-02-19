//
//  MainNC.swift
//  Sales
//
//  Created by Awab Aly-mac on 29/11/18.
//  Copyright © 2018 Awab Aly-mac. All rights reserved.
//

import UIKit

class NavigationShadow: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationBar.layer.setShadows(shadowColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), shadowOpacity: 0.9, shadowOffset: CGSize(width: 0, height: 3.0), shadowRadius: 3)
        
  
        self.navigationBar.tintColor = UIColor.black
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

  
}
