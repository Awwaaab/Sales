//
//  NewCLient.swift
//  Sales
//
//  Created by Awab Aly-mac on 21/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class NewCLient: UIViewController  {
    
    
   
    
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
        handleTextAnimation(anchor: DoneButtonYAnchor, centerConstant: -50)
        handleTextAnimation(anchor: TextYAnchor, centerConstant: -100)
        DataTextField.placeholder = "Write CLient Name Here :)"
    }
    @IBAction func writePhone(_ sender : UIButton){
        handleTextAnimation(anchor: DoneButtonYAnchor, centerConstant: -50)
        handleTextAnimation(anchor: TextYAnchor, centerConstant: -100)
        DataTextField.placeholder = "Write CLient Phon Here :)"
    }
    @IBAction func writeAdress(_ sender : UIButton){
        handleTextAnimation(anchor: DoneButtonYAnchor, centerConstant: -50)
        handleTextAnimation(anchor: TextYAnchor, centerConstant: -100)
        DataTextField.placeholder = "Write CLient Adress Here :)"
    }
    @IBAction func doneButton(_ sender : UIButton){
        handleTextAnimation(anchor: DoneButtonYAnchor, centerConstant: 400)
        handleTextAnimation(anchor: TextYAnchor, centerConstant: 350)
         DataTextField.placeholder = ""
    }
    @IBAction func SelectButtons(_ sender : UIButton){
  
        switch sender.tag {
        case 0:
            moveToSelector = "department"
        case 1:
            moveToSelector = "Country"
        case 2:
            moveToSelector = "City"
        case 3:
            moveToSelector = "Region"
        default:
            moveToSelector = "other"
        }
        
        print(moveToSelector)
      
           performSegue(withIdentifier: "GoToMultiSelectors", sender: sender)
          selectorDelegate?.MoveSelector(Selector: moveToSelector)
    }
    
    var moveToSelector : String!
    weak var selectorDelegate : SelectorDelegate?
 
    
    func handleTextAnimation(anchor:NSLayoutConstraint , centerConstant : CGFloat){
        
        anchor.constant = centerConstant
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()}
    }

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
