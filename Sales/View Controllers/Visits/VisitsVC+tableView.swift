//
//  VisitsVC+tableView.swift
//  Sales
//
//  Created by Awab Aly-mac on 15/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import UIKit


extension VisitsVC : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VisitViewModel.visits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("VisitTableViewCell", owner: self, options: nil)?.first as! VisitTableViewCell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitsCellData", for: indexPath) as! VisitTableViewCell  /* if you want to use the righster nib file method*/
        cell.handleOutlets(VisitData: VisitViewModel.visits[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let angle = CGFloat(90 * Float.pi/180)
        let x:CGFloat = 0.0
        let y:CGFloat = 0.0
        let z:CGFloat = 1.0
        let duration : Double = 0.5
        let acnchorPoint = CGPoint(x:0,y:0)
        
        var rotation=CATransform3DMakeRotation(angle,x,y,z)
       
        rotation.m34 = 1 / -500
        cell.contentView.layer.transform = rotation
        cell.contentView.layer.anchorPoint = acnchorPoint
        UIView.beginAnimations("rotation", context:nil)
        UIView.setAnimationDuration(duration)
        cell.contentView.layer.transform = CATransform3DIdentity
        UIView.commitAnimations()

    }
    
    
    func handleDelegateAndDatasource(){
        VisitsTableView.delegate = self
        VisitsTableView.dataSource = self
    }
}
