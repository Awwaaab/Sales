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
        print("Error \(error)")
    }
}

