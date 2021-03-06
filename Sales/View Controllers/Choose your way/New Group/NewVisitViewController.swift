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
    var alertTextfiled : UITextField?
    var vildatorCounter = 0
    var message = " "
    var locationManager:CLLocationManager!
    var currentLatitude = ""
    var currentLongtude = ""
    var chosenClientObject : ClientsAV!
    var chosentypeID : Int!
    var chosenPurposID : Int!
    
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
        self.view.handleObjectAnimation(objectAnchor: DatePickerVIewYPostion, centerConstant: -120)
        self.view.handleObjectAnimation(objectAnchor: selectionSaveButtonYPostion, centerConstant: 5)
    }
    @IBAction func getClient(_ sender:UIButton){
        performSegue(withIdentifier: "GetClient", sender: sender)
        
    }
    @IBAction func gettype(_ sender:UIButton){
        toViewController = selectController.type
        selectorPickerView.reloadAllComponents()
        self.view.handleObjectAnimation(objectAnchor: selectorPickerVIewYPostion, centerConstant: 0)
        self.view.handleObjectAnimation(objectAnchor: selectionSaveButtonYPostion, centerConstant: 5)
        chosenType.text = newVisitViewModel.selectType[0].name
        
    }
    @IBAction func getPurposes(_ sender:UIButton){
        toViewController = selectController.purposes
        selectorPickerView.reloadAllComponents()
        self.view.handleObjectAnimation(objectAnchor: selectorPickerVIewYPostion, centerConstant: 0)
        self.view.handleObjectAnimation(objectAnchor: selectionSaveButtonYPostion, centerConstant: 5)
        chosenPurpose.text = newVisitViewModel.selectPurpose[0].name
    }
    
    
    
    @IBAction func SaveButton(_ sender: UIButton) {
 
        if (validator()){
            self.newAddVisitViewModel.fetchAddVisit(clientId: String(chosenClientObject.id), purposValue: PriceTextField.text ?? "", type: String(chosentypeID), purpose: String(chosenPurposID), comment: descriptionTextFeild.text ?? "", longtitde: currentLongtude, latitude: currentLatitude)
            newAddVisitViewModel.fetchHandler = {
                self.showAlertController(alerTitle: "Saved", alertMessage: "thank your for your visit ", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
            }
            newAddVisitViewModel.showError = { (error) in
                print("==================================\(error)========\(error.localizedDescription)=========================" )
                self.showAlertController(alerTitle: "Network error", alertMessage: "Hmmm. seems that you are not connected", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default)
                
                print("<<<<<this is what you are looking for\(error.localizedDescription)>>>>>>>")
            }
            
        }
    }
    
    @IBAction func SaveGivenDataButtonThatAppearWithPickerView(_ sender: UIButton) {
        hideSelectorAndDatePickerWithAnimation()
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
            self.view.handleObjectAnimation(objectAnchor: selectorPickerVIewYPostion, centerConstant: 600)
            self.view.handleObjectAnimation(objectAnchor: selectionSaveButtonYPostion, centerConstant: 300)
        }
        if DatePickerVIewYPostion.constant == -120 {
            self.view.handleObjectAnimation(objectAnchor: DatePickerVIewYPostion, centerConstant: 480)
            self.view.handleObjectAnimation(objectAnchor: selectionSaveButtonYPostion, centerConstant: 300)
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
    
    
   
    
    
    
    let newVisitViewModel = NewVisitViewMode(client: Unsplash())
    let newAddVisitViewModel = AddVisitViewMode(client: Unsplash())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideSelectorPickeriewWhenTappedAround()
        self.selectorPickerView.layer.cornerRadius = 27
        self.selectorPickerView.clipsToBounds = true
        DatePickerView.handleDatePicker(cornerRadius: 20, backgroundColor: UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1))
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
            print("==================================\(error)========\(error.localizedDescription)=========================" )
            self.showAlertController(alerTitle: "Network error", alertMessage: "Hmmm. seems that you are not connected", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
        }
    
        newVisitViewModel.fetchNewVisit()
        newVisitViewModel.reloadData = {
            self.selectorPickerView.reloadAllComponents()
            self.chosentypeID = self.newVisitViewModel.selectType[0].id
            self.chosenPurposID = self.newVisitViewModel.selectPurpose[0].id
        }
     
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

