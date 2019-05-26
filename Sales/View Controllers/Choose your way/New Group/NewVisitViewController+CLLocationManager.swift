//
//  NewVisitViewController+CLLocationManager.swift
//  Sales
//
//  Created by Awab Aly-mac on 9/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//

import CoreLocation
import UIKit


extension NewVisitViewController :  CLLocationManagerDelegate{
    
    //MARK: - location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        self.currentLatitude = "\(userLocation.coordinate.latitude)"
        self.currentLongtude = "\(userLocation.coordinate.longitude)"
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("********\(error._code)***************\(error.localizedDescription)*******")
        
        
        let alertController = UIAlertController(title: "sorry 😔 ,you can't add visit", message: "Allow location to add visit", preferredStyle: .alert)
        let alertActoin = UIAlertAction(title: "Allow Location", style: .default) { (Action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    _ =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
        let alertCancel = UIAlertAction(title: "Ok", style: .cancel) {  (Action) in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(alertActoin)
        alertController.addAction(alertCancel)
        self.present(alertController, animated: true, completion: nil)
        showAlertController(alerTitle: "Opss ....", alertMessage: "you should open your locaiton", alertPreferredStyle: .alert, alertActionTitle: "Ok", alertActoinStyle: .default) { (action) in
            self.navigationController?.popViewController(animated:  true)
        }
    }
}

