//
//  ViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 29/11/18.
//  Copyright © 2018 Awab Aly-mac. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    
    @IBOutlet var SingInANDPassword: [UITextField]!
//    var valid : Bool!
       var valid  = true
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        if(textValidator()){
            print("send to API============ valid : \(valid )========")
//                 print("send to API============ valid : \(valid ?? true )========")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
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
                    x.attributedPlaceholder = NSAttributedString(string: "please enter your password", attributes: [NSAttributedStringKey.foregroundColor : UIColor.red])
                    valid = false
                }else if (x.text?.count)! < 8 {
                    x.text = ""
                    x.attributedPlaceholder = NSAttributedString(string: "the password must be at least 8 ", attributes:[ NSAttributedStringKey.foregroundColor : UIColor.darkGray])
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

