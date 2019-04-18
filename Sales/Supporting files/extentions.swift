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

enum UserDefaultsKeys : String{
    case isLogedIn , userID , user
}


extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLogedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLogedIn.rawValue)
    }
    func setUserID(ID : String){
        set(ID, forKey: UserDefaultsKeys.userID.rawValue)
    }
    func getUserID()-> String {
        return UserDefaultsKeys.userID.rawValue
    }
    
    
}


class CustomUserDefaults: UserDefaults {
     static let userID = UserDefaults.standard.value(forKey: UserDefaultsKeys.userID.rawValue) as! String
}

