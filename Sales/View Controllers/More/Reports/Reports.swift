//
//  Reborts.swift
//  Sales
//
//  Created by Awab Aly-mac on 22/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class Reports: UIViewController {
    
    @IBOutlet weak var Datepicker: UIDatePicker!
    @IBOutlet weak var reportsTableView: UITableView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var selectedClientLabel: UILabel!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var DatepickerYAnchor: NSLayoutConstraint!
    @IBOutlet weak var reportsImage: UIImageView!
    
    
    
    
    let reportsViewModel = ReportsViewMode(client: Unsplash())
    
    //    var chosenCLient : ClientsAV?
    var selectedClientID : String?
    
    
    var selectDateType : DateFilter!
    let currentDate = Date()
    let  DateForAPI = "yyyy-MM-dd"
    let DateForLabel =  "dd MMM, yyyy"
    var startDate : Date?
    var endDate : Date?
    var tableViewObserverKeyPath =  "contentSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
          reportsTableView.handleTableViewWithImage(tableViewIsHidden: true, image: self.reportsImage)
        reportsTableView.addObserver(self, forKeyPath: tableViewObserverKeyPath, options: .new, context: nil)
        
//        TableViewISHeadin(show: true)
        Datepicker.addTarget(self, action: #selector(Reports.setUpDate), for: .valueChanged)
        handleDelegateAndDatasource()
        UserDefaults.standard.setSelectedClient(selected: false)
        Datepicker.handleDatePicker(cornerRadius: 20, backgroundColor: UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.didSelectedClient(){
            selectedClientLabel.text = UserDefaults.standard.value(forKey: UserDefaultsKeys.client.rawValue) as? String
            selectedClientID = (UserDefaults.standard.value(forKey: UserDefaultsKeys.clientID.rawValue) as! String)
            
        }
    }
    // if we add Observer it into viewDidLoad remove it from deinit
    // if we add Observer it in viewWillAppear remove it from viewWillDisAppear

    deinit {
        reportsTableView.removeObserver(self, forKeyPath: tableViewObserverKeyPath)
    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {
            if obj == self.reportsTableView && keyPath == tableViewObserverKeyPath {
                tableViewHeight.constant = reportsTableView.contentSize.height

            }
        }
    }

    
    @IBAction func selectClient(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SelectClient") as? SelectClient
        self.navigationController?.show(controller!, sender: self)
        
    }
    
    // you can also put the datePiker and done button into view and move all the view all , do it later
    @IBAction func selectDate(_ sender:UIButton){
        
        switch sender.tag {
        case 0:
            selectDateType = .startDate
        case 1:
            selectDateType = .endDate
        default:
            print("print error selectDate filter sender")
        }
        
        self.view.handleObjectAnimation(objectAnchor: DatepickerYAnchor, centerConstant: 0)

        // reseting the date picker
        
        Datepicker.date = self.currentDate
        
        //
    }
    @IBAction func doneButton(_ sender: UIButton) {
        self.view.handleObjectAnimation(objectAnchor: DatepickerYAnchor, centerConstant: -600)
        pickDate()
    }
    
    @IBAction func getReborts(_ sender: UIButton) {
        LoadVisitReport()
        reportsViewModel.showError = {
            (error) in
            print("==================================\(error)========\(error.localizedDescription)=========================" )
            self.showAlertController(alerTitle: "Network error", alertMessage: "Hmmm. seems that you are not connected", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
                
            })
        }
    }
    
    
    func LoadVisitReport(){
        let startDateAPIForamt = formatter(date: startDate ?? currentDate, dateFormat: DateForAPI)
        let endDateAPIForamt = formatter(date: endDate ?? currentDate, dateFormat: DateForAPI)
        reportsViewModel.fetchReportVisits(startDate: startDateAPIForamt , endDate : endDateAPIForamt , ClientID : selectedClientID ?? "4")
        reportsViewModel.reloadData = {
            self.reportsTableView.reloadData()
            if self.reportsViewModel.visits.count == 0 {
                self.showAlertController(alerTitle: "Heads up", alertMessage: "sorry , we can't find any data related to your with this time range and this client", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default, handler: { (action) in
                    self.reportsTableView.handleTableViewWithImage(tableViewIsHidden: true, image: self.reportsImage)
                })
            }else {
                 self.reportsTableView.handleTableViewWithImage(tableViewIsHidden: false, image: self.reportsImage)
            }
            
        }
    }
    
    
    
    

    
    
    @objc func setUpDate(){
        pickDate()
    }
    
    private func formatter(date : Date , dateFormat : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
    
    func pickDate(){
        switch selectDateType {
        case .startDate?:
            startDate = Datepicker.date
            self.startDateLabel.text = formatter(date: startDate!, dateFormat: DateForLabel)
        case .endDate?:
            endDate = Datepicker.date
            self.endDateLabel.text = formatter(date: endDate!, dateFormat: DateForLabel)
        default:
            print("print error selectDate filter sender")
        }
    }
    
    
}


enum DateFilter{
    case startDate , endDate
}

/*
 

 1 - handle fetch error accournding to get client
 
 
 */
