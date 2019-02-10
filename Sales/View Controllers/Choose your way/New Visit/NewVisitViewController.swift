//
//  NewVisitViewController.swift
//  Sales
//
//  Created by Awab Aly-mac on 5/2/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit

class NewVisitViewController: UIViewController {

    @IBOutlet weak var shadowViewTopAncor0: NSLayoutConstraint!
    @IBOutlet weak var shadowViewTopAncor1: NSLayoutConstraint!
    @IBOutlet weak var shadowViewTopAncor2: NSLayoutConstraint!
    @IBOutlet weak var shadowViewTopAncor3: NSLayoutConstraint!
    @IBOutlet weak var shadowViewTopAncor4: NSLayoutConstraint!
    @IBOutlet weak var shadowViewTopAncor5: NSLayoutConstraint!
    
    var spacingBetweenShadows : CGFloat = 20
    
    func handleShadowspace(space : CGFloat){
        shadowViewTopAncor0.constant = space
        shadowViewTopAncor1.constant = space
        shadowViewTopAncor2.constant = space
        shadowViewTopAncor3.constant = space
        shadowViewTopAncor4.constant = space
        shadowViewTopAncor5.constant = space
    }
    @IBOutlet weak var shadowView: UIView!
    
    
    let LabelSaperators : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.addObserver(self, forKeyPath: "heightObserver", options: NSKeyValueObservingOptions.new, context: nil)
        
        print("nnnnnnnnnnnnnnn\(nnn)")
        handleShadowspace(space: 20)
        
        
    }
    deinit {
        shadowView.removeObserver(self, forKeyPath: "heightObserver")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UIView {
            if obj == self.shadowView && keyPath == "heightObserver" {
                balanceTableViewHeight.constant = balanceTabelView.contentSize.height
            }
        }
    }
   
}





//nameSaperator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
//nameSaperator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
//nameSaperator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
//nameSaperator.heightAnchor.constraint(equalToConstant: 1).isActive = true

