//
//  mainNB.swift
//  Sales
//
//  Created by Awab Aly-mac on 29/11/18.
//  Copyright © 2018 Awab Aly-mac. All rights reserved.
//

import UIKit

class mainNB: UINavigationBar {
    self.navigationController?.navigationBar.layer.backgroundColor = UIColor.black.cgColor
    self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
    self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
    self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5.0)
    self.navigationController?.navigationBar.layer.shadowRadius = 10
}
