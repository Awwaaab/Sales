//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
//

//    SidemenyLayout.constant = (SidemenyLayout.constant == 0 ) ? self.view.frame.size.width * 0.7 : 0
//    UIView.animate(withDuration: 1) {
//    self.view.layoutIfNeeded()}



import UIKit


protocol DelegateClient : NSObjectProtocol{
    func moveData(data : String)
}

enum selectController {
    case client , type , purposes
}

class NewVisitViewController: UIViewController , DateDelegate  , DelegateClient{
   
    

    
    
    @IBOutlet weak var selectorPickerVIewXPostion: NSLayoutConstraint!
    @IBOutlet weak var selectorPickerView: UIPickerView!
    @IBOutlet weak var chosenClient: UILabel!
    @IBOutlet weak var chosenType: UILabel!
    @IBOutlet weak var chosenPurpose : UILabel!
    @IBOutlet weak var writenPirce : UILabel!
    
    var toViewController : selectController?
    var priceTextFiled  = ""
    var alertTextfiled : UITextField?
    
    //MARK: date delegate
    weak var   delegate : controllerDelegate?
    func didSelectDate(date: String) {
        choosedDateLabel.text = date
    }
     //MARK: client delegate
    weak var ClientDelegate : DelegateClient?
    func moveData(data: String) {
        self.chosenClient?.text = data
        print("************************\(data)*****************")
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GetDate"{
            let controller = segue.destination as? DatePikerViewcontroller
            controller?.delegate = self
        }
        
//        if segue.identifier == "GetClient"{
//            let controller = segue.destination as? SelectClient
//              self = controller?.delegateClient
//        }
        
        
    }
    
    @IBOutlet weak var choosedDateLabel : UILabel!
    @IBAction func getdate(_ sender:UIButton){
        performSegue(withIdentifier: "GetDate", sender: sender)
    }
    @IBAction func getClient(_ sender:UIButton){
        performSegue(withIdentifier: "GetClient", sender: sender)
        //        toViewController = selectController.client
        //        selectorPickerView.reloadAllComponents()
        //         handleSelectorAnimation()
    }
    @IBAction func gettype(_ sender:UIButton){
        toViewController = selectController.type
        selectorPickerView.reloadAllComponents()
        handleSelectorAnimation()
        
    }
    @IBAction func getPurposes(_ sender:UIButton){
        toViewController = selectController.purposes
        selectorPickerView.reloadAllComponents()
        handleSelectorAnimation()
    }
    
    @IBAction func writePrice(_ sender:UIButton){
        writeThePriceAlertController()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        handleSelectorAnimation()
    }
    
    
    
    func hideSelectorPickeriewWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewVisitViewController.dismissSelectorPickeriew))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissSelectorPickeriew() {
        selectorPickerVIewXPostion.constant = 600
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()}
        
    }
    
    
    
    let newVisitViewModel = NewVisitViewMode(client: unsplashNewVisit())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideSelectorPickeriewWhenTappedAround()
        self.selectorPickerView.layer.cornerRadius = 27
        self.selectorPickerView.clipsToBounds = true
        
        // selectorPickerView.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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



