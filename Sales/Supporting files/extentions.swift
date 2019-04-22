//
//  extentions.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


//MARK: tableView extension
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





//MARK: View extension
//to move object with animation

extension UIView{
    func handleObjectAnimation(objectAnchor:NSLayoutConstraint , centerConstant : CGFloat){
        objectAnchor.constant = centerConstant
        UIView.animate(withDuration: 0.35) {
            self.layoutIfNeeded()}
    }
    
}


//MARK: UserDefaults extension

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



//MARK: CALayer extension
// adding shadows to Objects layer's

extension CALayer{
    func setShadows(shadowColor:CGColor,shadowOpacity:Float,shadowOffset:CGSize,shadowRadius:CGFloat){
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
        self.shadowColor = shadowColor
        self.shadowOpacity = shadowOpacity
    }
}




//MARK: UIViewController extension
// adding showAlertController func to the class

extension UIViewController {
    func showAlertController(alerTitle : String , alertMessage : String , alertPreferredStyle:UIAlertControllerStyle ,alertActionTitle : String , alertActoinStyle : UIAlertActionStyle,handler: ((UIAlertAction) -> Void)? = nil){
        let alertcont = UIAlertController(title: alerTitle,message: alertMessage,preferredStyle:alertPreferredStyle)
        let alertactCancel = UIAlertAction(title: alertActionTitle, style: alertActoinStyle,  handler:handler)
        alertcont.addAction(alertactCancel)
        self.present(alertcont, animated: true, completion: nil)
    }
}








