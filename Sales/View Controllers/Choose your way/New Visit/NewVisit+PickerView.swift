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
        
        
        
        if toViewController == selectController.client{
            return newVisitViewModel.onlyClient.count
        }else if toViewController == selectController.type{
            return newVisitViewModel.onlytype.count
        }else{
            return newVisitViewModel.onlyPurpose.count
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if toViewController == selectController.client{
            return newVisitViewModel.onlyClient[row]
        }else  if toViewController == selectController.type{
            return newVisitViewModel.onlytype[row]
        } else{
            return newVisitViewModel.onlyPurpose[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if toViewController == selectController.client{
            self.chosenClient.text = newVisitViewModel.onlyClient[row]
        }else if toViewController == selectController.type{
            self.chosenType.text = newVisitViewModel.onlytype[row]
        } else{
            self.chosenPurpose.text = newVisitViewModel.onlyPurpose[row]
        }
        
    }
   
 
    func handleSelectorAnimation(){

        selectorPickerVIewXPostion.constant = (selectorPickerVIewXPostion.constant == 0 ) ? 600 : 0
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()}
    }
    
}



