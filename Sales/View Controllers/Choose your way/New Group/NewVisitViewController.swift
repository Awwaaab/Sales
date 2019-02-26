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
    case client , type , purposes
}

class NewVisitViewController: UIViewController   , DelegateClient{
    
    
    
    
    @IBOutlet weak var DatePickerView : UIDatePicker!
    @IBOutlet weak var DatePickerVIewYPostion: NSLayoutConstraint!
    @IBOutlet weak var selectorPickerVIewYPostion: NSLayoutConstraint!
    @IBOutlet weak var selectorPickerView: UIPickerView!
    @IBOutlet weak var chosenDate: UILabel!
    @IBOutlet weak var chosenClient: UILabel!
    @IBOutlet weak var chosenType: UILabel!
    @IBOutlet weak var chosenPurpose : UILabel!
  
    
    var toViewController : selectController?
    var priceTextFiled  = ""
    var alertTextfiled : UITextField?
    
    //MARK: date delegate
    weak var   delegate : controllerDelegate?

    //MARK: client delegate
    func moveData(data: String) {
        self.chosenClient?.text = data
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "GetClient"{
                   let controller = segue.destination as? SelectClient
                    controller?.delegateClient = self
                }
    }
    
  
    @IBAction func getdate(_ sender:UIButton){
         let current = Date()
       setDate(date: current)
    handlePickerPostionViewAnimation(anchor: DatePickerVIewYPostion, centerConstant: -120)
    }
    @IBAction func getClient(_ sender:UIButton){
        performSegue(withIdentifier: "GetClient", sender: sender)
        
    }
    @IBAction func gettype(_ sender:UIButton){
        toViewController = selectController.type
        selectorPickerView.reloadAllComponents()
        handlePickerPostionViewAnimation(anchor: selectorPickerVIewYPostion, centerConstant: 0)
        
    }
    @IBAction func getPurposes(_ sender:UIButton){
        toViewController = selectController.purposes
        selectorPickerView.reloadAllComponents()
        handlePickerPostionViewAnimation(anchor: selectorPickerVIewYPostion, centerConstant: 0)
    }
    

    
    @IBAction func saveButton(_ sender: UIButton) {
       hideSelectorAndDatePickerWhenUseSaveButton()
    }
    
    
    private func handleDatePicker(){
        DatePickerView.layer.cornerRadius = 20
        DatePickerView.clipsToBounds = true
        DatePickerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
    
    private func hideSelectorPickeriewWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewVisitViewController.dismissSelectorPickeriew))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissSelectorPickeriew() {
        selectorPickerVIewYPostion.constant = 600
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()}
    }
    
    private func hideSelectorAndDatePickerWhenUseSaveButton(){
        if selectorPickerVIewYPostion.constant == 0 {
            handlePickerPostionViewAnimation(anchor: selectorPickerVIewYPostion, centerConstant: 600)
        }
        if DatePickerVIewYPostion.constant == -120 {
            handlePickerPostionViewAnimation(anchor: DatePickerVIewYPostion, centerConstant: 480)
        }
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
        handleDatePicker()
        DatePickerView.addTarget(self, action: #selector(NewVisitViewController.putDateIntoITsLable), for: .valueChanged )
       
    }
    
    
    //MARK: date func
    @objc func putDateIntoITsLable(){
       setDate(date: DatePickerView.date)
    }
    
    func setDate(date : Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM,yyyy hh:mm a"
        chosenDate.text = dateFormatter.string(from: date)
        
    }
    
}



