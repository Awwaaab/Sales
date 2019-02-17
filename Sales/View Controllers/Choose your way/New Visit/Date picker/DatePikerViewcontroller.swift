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
        
        let _ = Date()
        
        
        handleDidSelectDate()
        DatePicker.addTarget(self, action: #selector(DatePikerViewcontroller.dataChanged), for: .valueChanged)
        
    }
    
 //   func setDate(_ date: Date, animated: Bool)
    
    func handleDidSelectDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM,yyyy hh:mm a"
        didSelectDate = dateFormatter.string(from:DatePicker.date)
        
    }
    
    @objc func dataChanged(){
        handleDidSelectDate()
    }
    
}
 
