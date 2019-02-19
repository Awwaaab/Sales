//
//  MoreVC.swift
//  Sales
//
//  Created by Awab Aly-mac on 3/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
 let Cellspacing : CGFloat = 30
 let CellHeight : CGFloat = 80
    @IBOutlet weak var MenuTableView: UITableView!
    var MenuImage : [UIImage] = [ #imageLiteral(resourceName: "Repoerts24Px") , #imageLiteral(resourceName: "VisitCalendar24Px")]
    var MenuName : [String] = ["Reporst", "Visit Calendar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   handelDelegateAndDataSource()
    }

}
