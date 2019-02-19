//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
//

import UIKit

enum selectController {
    case client , type
}

class NewVisitViewController: UIViewController , DateDelegate  {
    
    @IBOutlet weak var selectorPickerView: UIPickerView!
    @IBOutlet weak var chosenClient: UILabel!
    @IBOutlet weak var chosenType: UILabel!
    
    var toViewController : selectController?
    
    weak var   delegate : controllerDelegate?
    
    
    
    func didSelectDate(date: String) {
        choosedDateLabel.text = date
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GetDate"{
            let controller = segue.destination as? DatePikerViewcontroller
            controller?.delegate = self
        }
        
    }
    
    
    
    @IBOutlet weak var choosedDateLabel : UILabel!
    @IBAction func getdate(_ sender:UIButton){
        performSegue(withIdentifier: "GetDate", sender: sender)
    }
    @IBAction func getClient(_ sender:UIButton){
        toViewController = selectController.client
        selectorPickerView.isHidden = false
        selectorPickerView.reloadAllComponents()
    }
    @IBAction func gettype(_ sender:UIButton){
      
        toViewController = selectController.type
        selectorPickerView.isHidden = false
        selectorPickerView.reloadAllComponents()

    }
    let newVisitViewModel = NewVisitViewMode(client: unsplashNewVisit())
    
    @IBAction func saveButton(_ sender: UIButton) {
        selectorPickerView.isHidden = true
      
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectorPickerView.backgroundColor = UIColor.cyan
        selectorPickerView.isHidden = true
        
        
        
        newVisitViewModel.showError = { (error) in
            print("==================================\(error)=================================")
            self.showAlertController(alerTitle: "Network error", alertMessage: error.localizedDescription, alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                 self.navigationController?.popViewController(animated: true)
            })
     
        }
        
        newVisitViewModel.reloadData = {
            self.selectorPickerView.reloadAllComponents()
        }
        newVisitViewModel.fetchNewVisit()
        
        
    }
    
   

}





extension NewVisitViewController : UIPickerViewDataSource ,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        if toViewController == selectController.client{
            return newVisitViewModel.onlyClient.count
        }else{
            return newVisitViewModel.onlytype.count
        }

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       
        if toViewController == selectController.client{
            return newVisitViewModel.onlyClient[row]
        }else{
            return newVisitViewModel.onlytype[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
         
        if toViewController == selectController.client{
            self.chosenClient.text = newVisitViewModel.onlyClient[row]
        }else{
            self.chosenType.text = newVisitViewModel.onlytype[row]
        }
        
    }
    
}


