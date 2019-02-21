//
//  protocols+extentions.swift
//  Sales
//
//  Created by Awab Aly-mac on 18/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


extension CALayer{
    func setShadows(shadowColor:CGColor,shadowOpacity:Float,shadowOffset:CGSize,shadowRadius:CGFloat){
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
        self.shadowColor = shadowColor
        self.shadowOpacity = shadowOpacity
    }
}




//    func SWAlertcontroller(error:String){
//        let alertcont = UIAlertController(title: " Network Error ",message: error  ,preferredStyle:.alert)
//        let alertactCancel = UIAlertAction(title: "Ok", style: .default,  handler: { (action) in
//            self.navigationController?.popViewController(animated: true)
//        })
//        alertcont.addAction(alertactCancel)
//        self.present(alertcont, animated: true, completion: nil)
//
//    }
//}
extension UIViewController {
    func showAlertController(alerTitle : String , alertMessage : String , alertPreferredStyle:UIAlertControllerStyle ,alertActionTitle : String , alertActoinStyle : UIAlertActionStyle,handler: ((UIAlertAction) -> Void)? = nil){
         let alertcont = UIAlertController(title: alerTitle,message: alertMessage,preferredStyle:alertPreferredStyle)
        let alertactCancel = UIAlertAction(title: alertActionTitle, style: alertActoinStyle,  handler:handler)
        alertcont.addAction(alertactCancel)
        self.present(alertcont, animated: true, completion: nil)
    }
}


    
