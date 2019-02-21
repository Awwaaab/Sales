//
//  extentions.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
extension UITableView {
    func handlAnimation(animationIsOn : Bool ,activityIndicator : NVActivityIndicatorView ,scrolView : UIScrollView?){
        if animationIsOn == true {
           
            activityIndicator.startAnimating()
            self.isHidden = true
            scrolView?.isHidden = true
        }else{
            self.reloadData()
            activityIndicator.stopAnimating()
            self.isHidden = false
            scrolView?.isHidden = false
        }
    }
}

