//
//  NewCLient.swift
//  Sales
//
//  Created by Awab Aly-mac on 21/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class NewCLient: UIViewController  {
    
    // still want to apply textfield delegate and handle keyboard show a disappear 
   
    
    @IBOutlet weak var TextYAnchor: NSLayoutConstraint!
    @IBOutlet weak var DoneButtonYAnchor: NSLayoutConstraint!
    
    @IBOutlet weak var ClientnameLabel : UILabel!
    @IBOutlet weak var ClientPhoneLabel : UILabel!
    @IBOutlet weak var ClientAdressLabel : UILabel!
    @IBOutlet weak var ClientCountyLabel : UILabel!
    @IBOutlet weak var ClientDepartmentLabel : UILabel!
    @IBOutlet weak var ClientCityLabel : UILabel!
    @IBOutlet weak var ClientRegionLabel : UILabel!
    
    @IBOutlet weak var DataTextField : UITextField!
    
    
//    @IBOutlet var SelectCollectionButtons: [UIButton]!
//    
    
    
    @IBAction func writeName(_ sender : UIButton){
        self.view.handleObjectAnimation(objectAnchor: DoneButtonYAnchor, centerConstant: -50)
        self.view.handleObjectAnimation(objectAnchor: TextYAnchor, centerConstant: -100)
        DataTextField.placeholder = "Write CLient Name Here :)"
        textFieldInUse = .name
        
    }
    @IBAction func writePhone(_ sender : UIButton){
        self.view.handleObjectAnimation(objectAnchor: DoneButtonYAnchor, centerConstant: -50)
        self.view.handleObjectAnimation(objectAnchor: TextYAnchor, centerConstant: -100)
        DataTextField.placeholder = "Write CLient Phon Here :)"
        textFieldInUse = .phone
    }
    @IBAction func writeAdress(_ sender : UIButton){
        self.view.handleObjectAnimation(objectAnchor: DoneButtonYAnchor, centerConstant: -50)
        self.view.handleObjectAnimation(objectAnchor: TextYAnchor, centerConstant: -100)
        DataTextField.placeholder = "Write CLient Adress Here :)"
        textFieldInUse = .adress
    }
    @IBAction func doneButton(_ sender : UIButton){
        self.view.handleObjectAnimation(objectAnchor: DoneButtonYAnchor, centerConstant: 400)
        self.view.handleObjectAnimation(objectAnchor: TextYAnchor, centerConstant: 350)
         DataTextField.placeholder = ""
        
        switch textFieldInUse {
        case .name:
            self.ClientnameLabel.text = DataTextField.text
        case .phone:
            self.ClientPhoneLabel.text = DataTextField.text
        case .adress:
            self.ClientAdressLabel.text = DataTextField.text
        default:
            print("something went wrong")
        }
        self.DataTextField.text = ""
    }
    @IBAction func SelectButtons(_ sender : UIButton){
  
        switch sender.tag {
        case 0:
            moveToSelector = .Department
        case 1:
            moveToSelector = .Country
        case 2:
            moveToSelector = .City
        case 3:
            moveToSelector = .Region
        default:
            moveToSelector = .other
        }
        
        print(moveToSelector)
      
           performSegue(withIdentifier: "GoToMultiSelectors", sender: sender)
          selectorDelegate?.MoveSelector(Selector: moveToSelector)
    }
    
    var moveToSelector : SelectorType!
    weak var selectorDelegate : SelectorDelegate?
    var textFieldInUse : TextFieldInUse!
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "GoToMultiSelectors" {
         let controller = segue.destination as? SelectCategoryOrCityOrCountry
           self.selectorDelegate = controller
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataTextField.layer.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.8705882353, blue: 0.8823529412, alpha: 1)
       
    }


}


enum SelectorType{
    case Department , Country , City , Region , other
}

enum TextFieldInUse {
    case name , phone , adress
}


