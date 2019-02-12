//
//  DatePikerViewcontroller.swift
//  Sales
//
//  Created by Awab Aly-mac on 10/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class DatePikerViewcontroller: UIViewController {

  
    var didSelectDate = ""
    var delegate : DateDelegate?
    @IBOutlet weak var DatePicker : UIDatePicker!
    @IBAction func conferm(_ sender : UIButton){
        
        delegate?.didSelectDate(date: didSelectDate)
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DatePicker.datePickerMode = .date
        DatePicker.addTarget(self, action: #selector(DatePikerViewcontroller.dataChanged(datePicker:)), for: .valueChanged)
    }
    
    @objc func dataChanged(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        didSelectDate = dateFormatter.string(from:datePicker.date)
        
    }

}

