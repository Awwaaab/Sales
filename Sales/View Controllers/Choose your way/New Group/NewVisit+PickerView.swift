//
//  NewVisit+PickerView.swift
//  Sales
//
//  Created by Awab Aly-mac on 21/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


extension NewVisitViewController : UIPickerViewDataSource ,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        if toViewController == selectController.type{
            return newVisitViewModel.dedupetype.count
          
        }else {
            return newVisitViewModel.dedupePurpose.count
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
          if toViewController == selectController.type{
            return newVisitViewModel.dedupetype[row]
        } else{
            return newVisitViewModel.dedupePurpose[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
         if toViewController == selectController.type{
            self.chosenType.text = newVisitViewModel.dedupetype[row]
        } else{
            self.chosenPurpose.text = newVisitViewModel.dedupePurpose[row]
        }
        
    }
   
 
    func handlePickerPostionViewAnimation(anchor:NSLayoutConstraint , centerConstant : CGFloat){

        anchor.constant = centerConstant
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()}
    }
}

extension NewVisitViewController :  UITextFieldDelegate {
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}