//
//  SignInVC+Validation.swift
//  Sales
//
//  Created by Awab Aly-mac on 9/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

extension SignInVC {
    
    
    func textValidator() -> Bool{
        valid = true
        for x in SingInANDPassword{
            switch x.textContentType{
            case .emailAddress:
                if (x.text?.isEmpty)!{
                    x.attributedPlaceholder = NSAttributedString(string: "please enter your email", attributes: [NSAttributedStringKey.foregroundColor : UIColor.red])
                    valid = false
                }else{
                    valid = isValidEmail(email: x.text)
                    if valid == false {
                        self.AnimationShakeTextField(textField: x)
                    }
                }
            case .password:
                if (x.text?.isEmpty)!{
                    spaceValidator(txt: x)
                    x.attributedPlaceholder = NSAttributedString(string: "please enter your password", attributes: [NSAttributedStringKey.foregroundColor : UIColor.red])
                    valid = false
                }
            default:
                
                self.showAlertController(alerTitle: "Error", alertMessage: "please contant your developer", alertPreferredStyle: .alert, alertActionTitle: "ok", alertActoinStyle: .default)
                
            }
        }
        return valid
    }
    
    
    
    
    
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        let result = pred.evaluate(with: email)
        return result
        
    }
    
    
    func spaceValidator(txt : UITextField){
        if !(txt.text?.trimmingCharacters(in: .whitespaces).isEmpty)!{
            valid = true
        }else{
            valid = false
        }
    }
    
    
    func AnimationShakeTextField(textField:UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: .init(x: textField.center.x - 5, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: .init(x: textField.center.x  + 5, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
}



