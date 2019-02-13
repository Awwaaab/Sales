//
//  DatePikerViewcontroller.swift
//  Sales
//
//  Created by Awab Aly-mac on 10/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//


import UIKit

class DatePikerViewcontroller: UIViewController {
    
    
    var didSelectDate : String = ""
    weak var delegate : DateDelegate?
    @IBOutlet weak var DatePicker : UIDatePicker!
    @IBAction func conferm(_ sender : UIButton){
        
        delegate?.didSelectDate(date: didSelectDate)
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
//        let dateFormater = DateFormatter()
//        dateFormater.dateStyle = DateFormatter.Style.medium
//        didSelectDate = dateFormater.string(from: date)
       otherhandleDidSelectDate(date: date)
     //   handleDidSelectDate()
        DatePicker.addTarget(self, action: #selector(DatePikerViewcontroller.dataChanged), for: .valueChanged)
        
    }
    
    
    func otherhandleDidSelectDate(date : Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        didSelectDate = dateFormatter.string(from:date)
    }
    
//    func handleDidSelectDate(){
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.medium
//        didSelectDate = dateFormatter.string(from:DatePicker.date)
//    }
    
    @objc func dataChanged(){
      otherhandleDidSelectDate(date: DatePicker.date)
    }
    
}


