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
    @IBOutlet weak var AfterFilterTableView: UITableView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var EndDateLabel: UILabel!
    @IBOutlet weak var DoneYAnchor: NSLayoutConstraint!
    @IBOutlet weak var DatepickerYAnchor: NSLayoutConstraint!
    
    
    
    
    
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
        self.view.handleObjectAnimation(objectAnchor: DoneYAnchor, centerConstant: 150)
       // reseting the date picker
        let current = Date()
        Datepicker.date = current
        
//
    }
    @IBAction func doneButton(_ sender: UIButton) {
        self.view.handleObjectAnimation(objectAnchor: DatepickerYAnchor, centerConstant: -500)
        self.view.handleObjectAnimation(objectAnchor: DoneYAnchor, centerConstant: -350)
      
        let current = Date()
       
     
        
        let startDateAPIForamt = formatter(date: startDate ?? current, dateFormat: DateForAPI)
        let endDateAPIForamt = formatter(date: endDate ?? current, dateFormat: DateForAPI)
        print( startDateAPIForamt + "\n" +  endDateAPIForamt )
        if startDate != nil && endDate != nil {
            reportsViewModel.fetchReportVisits(startDate: startDateAPIForamt , endDate : endDateAPIForamt)
            reportsViewModel.reloadData = {
                self.AfterFilterTableView.reloadData()
            }
        }
    
    }
    
    
    var selectDateType : DateFilter!

    let  DateForAPI = "yyyy-MM-dd"
    let DateForLabel =  "dd MMM, yyyy"
    var startDate : Date?
    var endDate : Date?
   
    let reportsViewModel = ReportsViewMode(client: Unsplash())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Datepicker.addTarget(self, action: #selector(Reports.setUpDate), for: .valueChanged)
         handleDelegateAndDatasource()
    }

    @objc func setUpDate(){

        switch selectDateType {
        case .startDate:
            startDate = Datepicker.date
            self.startDateLabel.text = formatter(date: startDate!, dateFormat: DateForLabel)
        case .endDate:
            endDate = Datepicker.date
            self.EndDateLabel.text = formatter(date: endDate!, dateFormat: DateForLabel)
        default:
            print("print error selectDate filter sender")
        }
    }
    
   private func formatter(date : Date , dateFormat : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
    
}

enum DateFilter{
    case startDate , endDate
}


