//
//  VisitTableViewCell.swift
//  Sales
//
//  Created by Awab Aly-mac on 1/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


class VisitTableViewCell: UITableViewCell {
    // this table view cell that serve visits,reports,client,balance
    // mn ala5er kda hya el cell eltawiiiila
    
    @IBOutlet weak var firstAPIDataLabel: UILabel!
    @IBOutlet weak var secondAPIDataLabel: UILabel!
    @IBOutlet weak var thirdAPIDataLabel: UILabel!
    @IBOutlet weak var fourthAPIDataLabel: UILabel!
    @IBOutlet weak var fifthAPIDataLabel: UILabel!
    @IBOutlet weak var sixthAPIDataLabel: UILabel!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    
    func handleOutlets(VisitData : Visit){
        firstAPIDataLabel.attributedText = NSAttributedString(string: VisitData.date_time)
        secondAPIDataLabel.attributedText = NSAttributedString(string: VisitData.client_name)
        thirdAPIDataLabel.attributedText = NSAttributedString(string:VisitData.type_name)
        fifthAPIDataLabel.attributedText = NSAttributedString(string:VisitData.status)
        sixthAPIDataLabel.attributedText = NSAttributedString(string : VisitData.visit_value)
        fourthAPIDataLabel.attributedText = NSAttributedString(string: VisitData.purpose_name)
        
    }

    
    


    func handleOutlets(ClientsData : Clients){
        firstAPIDataLabel.attributedText = NSAttributedString(string: ClientsData.name)
        secondAPIDataLabel.attributedText = NSAttributedString(string: ClientsData.phone)
        thirdAPIDataLabel.attributedText = NSAttributedString(string:ClientsData.phone2)
        fourthAPIDataLabel.attributedText = NSAttributedString(string: ClientsData.category)
        fifthAPIDataLabel.attributedText = NSAttributedString(string:ClientsData.address)
        func handelTages(){
            firstLabel.text = "Name"
            secondLabel.text = "Phone 1"
            thirdLabel.text = "Phone 2"
            fourthLabel.text = "Department "
            fifthLabel.text = "Address "
            sixthLabel.isHidden = true
            sixthAPIDataLabel.isHidden = true
        }
       handelTages()
    }
    
    func handleOutlets(Balance : Balances){
        firstAPIDataLabel.attributedText = NSAttributedString(string: Balance.date)
        secondAPIDataLabel.attributedText = NSAttributedString(string: Balance.sale_name)
        thirdAPIDataLabel.attributedText = NSAttributedString(string:Balance.value)
       
        func handelTages(){
            firstLabel.text = "Date"
            secondLabel.text = "Client"
            thirdLabel.text = "Price"
            fourthLabel.isHidden = true
            fifthLabel.isHidden = true
            sixthLabel.isHidden = true
            fourthAPIDataLabel.isHidden = true
            fifthAPIDataLabel.isHidden = true
            sixthAPIDataLabel.isHidden = true
            
        }
        handelTages()
        
    }
   
    
}
