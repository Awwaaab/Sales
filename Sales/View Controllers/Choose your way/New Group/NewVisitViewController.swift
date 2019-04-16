//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
//


import UIKit
import CoreLocation
enum selectController {
    case  type , purposes
}

class NewVisitViewController: UIViewController  , DelegateClient {
    
    
    @IBOutlet weak var DatePickerView : UIDatePicker!
    @IBOutlet weak var DatePickerVIewYPostion: NSLayoutConstraint!
    @IBOutlet weak var selectionSaveButtonYPostion: NSLayoutConstraint!
    @IBOutlet weak var selectorPickerVIewYPostion: NSLayoutConstraint!
    @IBOutlet weak var selectorPickerView: UIPickerView!
    @IBOutlet weak var chosenDate: UILabel!
    @IBOutlet weak var chosenClient: UILabel!
    @IBOutlet weak var chosenType: UILabel!
    @IBOutlet weak var chosenPurpose : UILabel!
    @IBOutlet weak var PriceTextField: UITextField!
    @IBOutlet weak var descriptionTextFeild: UITextField!
    
    
    
    var toViewController : selectController?
    var priceTextFiled  = ""
    var alertTextfiled : UITextField?
    var vildatorCounter = 0
    var message = " "
    var locationManager:CLLocationManager!
    var currentLatitude = ""
    var currentLongtude = ""
    var chosenClientObject : ClientsAV!
    
    //MARK: client delegate
    func moveData(data: ClientsAV) {
        self.chosenClient?.text = data.name
        self.chosenClientObject = data
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
        handlePickerPostionViewAnimation(anchor: selectionSaveButtonYPostion, centerConstant: 5)
    }
    @IBAction func getClient(_ sender:UIButton){
        performSegue(withIdentifier: "GetClient", sender: sender)
        
    }
    @IBAction func gettype(_ sender:UIButton){
        toViewController = selectController.type
        selectorPickerView.reloadAllComponents()
        handlePickerPostionViewAnimation(anchor: selectorPickerVIewYPostion, centerConstant: 0)
        handlePickerPostionViewAnimation(anchor: selectionSaveButtonYPostion, centerConstant: 5)
        chosenType.text = newVisitViewModel.dedupetype[0]
        
    }
    @IBAction func getPurposes(_ sender:UIButton){
        toViewController = selectController.purposes
        selectorPickerView.reloadAllComponents()
        handlePickerPostionViewAnimation(anchor: selectorPickerVIewYPostion, centerConstant: 0)
        handlePickerPostionViewAnimation(anchor: selectionSaveButtonYPostion, centerConstant: 5)
        chosenPurpose.text = newVisitViewModel.dedupePurpose[0]
    }
    
    
    
    @IBAction func SaveButton(_ sender: UIButton) {
 
        if (validator()){
            self.newAddVisitViewModel.fetchAddVisit()
//            let chosenClientId = self.chosenClientObject.id
//            guard let chosenDate = self.chosenDate.text  ,let chosenType = self.chosenType.text , let chosenPurpose = self.chosenPurpose.text ,  let Price = self.PriceTextField.text ,  let description = self.descriptionTextFeild.text   else {return}
//            self.newAddVisitViewModel.fetchAddVisit(saleId: <#T##String#>, clientId: String(chosenClientId), type: <#T##String#>, purpose: <#T##String#>, purposValue: Price, comment: description, longtitde: currentLongtude, latidue: currentLatitude)
            newAddVisitViewModel.showError = { (error) in
                print("==================================\(error)=================================")
                self.showAlertController(alerTitle: "Network error", alertMessage: error.localizedDescription, alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default)
                
                print("<<<<<this is what you are looking for\(error.localizedDescription)>>>>>>>")
            }
            
        }
    }
    
    @IBAction func SaveGivenDataButtonThatAppearWithPickerView(_ sender: UIButton) {
        hideSelectorAndDatePickerWithAnimation()
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
        self.view.endEditing(true) //hiding the keyboard when tap around
        hideSelectorAndDatePickerWithAnimation()
    }
    
    private func hideSelectorAndDatePickerWithAnimation(){
        if selectorPickerVIewYPostion.constant == 0 {
            handlePickerPostionViewAnimation(anchor: selectorPickerVIewYPostion, centerConstant: 600)
            handlePickerPostionViewAnimation(anchor: selectionSaveButtonYPostion, centerConstant: 300)
        }
        if DatePickerVIewYPostion.constant == -120 {
            handlePickerPostionViewAnimation(anchor: DatePickerVIewYPostion, centerConstant: 480)
            handlePickerPostionViewAnimation(anchor: selectionSaveButtonYPostion, centerConstant: 300)
        }
    }
    
    func validator() -> Bool{
        vildatorCounter = 0
        
        if (descriptionTextFeild.text?.isEmpty)! {
            message = "Please enter description"
        }else{ vildatorCounter += 1}
        if (PriceTextField.text?.isEmpty)! {
            message = "Please enter price"
        }else{ vildatorCounter += 1}
        if chosenPurpose.text == "Select Target"{
            message = "Please choose your Target"
        }else{ vildatorCounter += 1}
        if chosenType.text == "Select Type"{
            message = "Please Select Type"
        }else{ vildatorCounter += 1}
        if chosenClient.text == "Select Client"{
            message = "Please Select Client"
        }else{ vildatorCounter += 1}
        if chosenDate.text == "Select Date"{
            message =  "Please enter a valied Date"
        }else{ vildatorCounter += 1}

        if vildatorCounter == 0 {
            self.showAlertController(alerTitle: "input Error", alertMessage: "All data requard", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default)
            return false
        }else if vildatorCounter != 6  {
            self.showAlertController(alerTitle: "input Error", alertMessage: message, alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default)
            return false
        }else{
            return true
        }
        
    }
    
    
   
    
    
    
    let newVisitViewModel = NewVisitViewMode(client: unsplash())
    let newAddVisitViewModel = AddVisitViewMode(client: unsplash())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        
        hideSelectorPickeriewWhenTappedAround()
        self.selectorPickerView.layer.cornerRadius = 27
        self.selectorPickerView.clipsToBounds = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
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

