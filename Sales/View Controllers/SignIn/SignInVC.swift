//
//  ViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 29/11/18.
//  Copyright © 2018 Awab Aly-mac. All rights reserved.
//

import UIKit

class SignInVC: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var passwordShadow: UIView!
    @IBOutlet weak var forgetpasswordOutlet: UIButton!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    @IBOutlet weak var usernameOrEmailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var EmailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet var SingInANDPassword: [UITextField]!
//    var valid : Bool!
    var valid  = true
    
  
    
      let signInViewModel = SingInViewModel(client: unsplash())
  
    @IBAction func signInButton(_ sender: UIButton) {
       
        switch buttonType {
        case ButtonType.signIN:

            if (textValidator()){
                guard  let userEmail = EmailTextFeild.text ,  let userPassword = passwordTextFeild.text else {return}
                signInViewModel.fetchUser(email: userEmail, passowrd: userPassword)
                signInViewModel.perfromSingIn = {
                    self.performSegue(withIdentifier: "SingIn", sender: nil)
                    UserDefaults.standard.setLoggedIn(value: true)
                    

                }
            }
        case ButtonType.SendEmail:
            if (textValidator()){
                //                guard  let userEmail = EmailTextFeild.text else {return}
                //                signInViewModel.fetchUser(email: userEmail)
                //                signInViewModel.perfromSingIn = {
                self.showAlertController(alerTitle: "Check your email", alertMessage: "we've sent you an email to restore your password", alertPreferredStyle: .alert, alertActionTitle: "Thanks", alertActoinStyle: .default)
                self.showForgetPasswordCompontant( IsHiden: false, usernameOrEmailLabel: "User name / Email address", passwordLabel: "SIGN IN", buttonType:  ButtonType.signIN)
                //                }
            }
            
            
        }
    }
    
    
    enum ButtonType {
        case signIN , SendEmail
    }
    
    var buttonType : ButtonType = ButtonType.signIN
    var someBoolain = false
       @IBAction func forgetPassword(_ sender: UIButton) {
   
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInVC
        controller.someBoolain = true
        self.show(controller, sender: self)
        
        
       
    }
    
    func showForgetPasswordCompontant( IsHiden:Bool ,usernameOrEmailLabel : String, passwordLabel : String , buttonType : ButtonType ){
         self.passwordTextFeild.isHidden = IsHiden
        
          self.passwordLabel.isHidden = IsHiden
         self.forgetpasswordOutlet.isHidden = IsHiden
        UIView.animate(withDuration: 0.35) {
            self.usernameOrEmailLabel.text =  usernameOrEmailLabel
            self.passwordShadow.isHidden = IsHiden
            self.signInButtonOutlet.setTitle(passwordLabel, for: .normal)
            self.passwordImage.isHidden = IsHiden
            self.buttonType = buttonType
        }
    }
    
    var alertMessageTitle = ""
    var alertMessageDescription = ""
   private let NetworkErrorResponse = "The Internet connection appears to be offline."
   private let wrongPasswordResponse  = "The operation couldn’t be completed. (Sales.APIError error 1.)"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if someBoolain{
            showForgetPasswordCompontant( IsHiden: true, usernameOrEmailLabel: "Email", passwordLabel: "Send", buttonType:  ButtonType.SendEmail)
        }

        
        signInViewModel.showError = { (error) in
            switch error.localizedDescription {
            case self.wrongPasswordResponse:
                self.alertMessageTitle = "wrong password"
                self.alertMessageDescription = "username or password is not valid please check them and try again"
            case self.NetworkErrorResponse:
                self.alertMessageTitle = "you are Offline!"
                self.alertMessageDescription = "The Internet connection appears to be offline"
            
            default:
                self.alertMessageTitle = "Unkown error"
                self.alertMessageDescription = "please call your developer"
            }
            
            
            print("==================================\(error)=================================")
            DispatchQueue.main.async {
                self.showAlertController(alerTitle:  self.alertMessageTitle , alertMessage: self.alertMessageDescription, alertPreferredStyle: .alert, alertActionTitle: "ok", alertActoinStyle: .default)
                print("this is what you looking for <<< \(error.localizedDescription)>>>>>")
            }
        
        }

        EmailTextFeild.returnKeyType = UIReturnKeyType.done
        passwordTextFeild.returnKeyType = UIReturnKeyType.done
        EmailTextFeild.delegate = self
        passwordTextFeild.delegate = self
        hideKeyBoardWhenTappedAround()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SingIn"{
            if let destination = segue.destination as? UITabBarController{
                if let controller = destination.viewControllers?.first as? UINavigationController{
                    if let choosenController = controller.topViewController as? ChooseYourWay{
                        choosenController.userInfo = signInViewModel.userInfo
                    }
                    
                }
            }
        }
    }
    
    //reseting the password textField to complete signout action
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        passwordTextFeild.text = "password"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        EmailTextFeild.resignFirstResponder()
        passwordTextFeild.resignFirstResponder()
        return true
    }
   
    private func hideKeyBoardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInVC.dismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyBoard() {
        self.view.endEditing(true) //hiding the keyboard when tap around
     
    }

    


    
}

