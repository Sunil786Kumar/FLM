//
//  LocationManager.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject {
    
    static let shared = LocationManager()
    
    var locationManager: CLLocationManager!
    
    //successfully found location
    var userLocationSuccess: ((CLLocationCoordinate2D?) -> ())?
    
    //not able to find the location
    var userLocationFailure: (() -> ())?
    
    func findUserLocation(success:@escaping (CLLocationCoordinate2D?) -> (), failure:@escaping() -> ()) {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            userLocationSuccess = success
            userLocationFailure = failure
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        guard let userLocation = userLocationSuccess else {
            return
        }
        userLocation(center)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let userLocationFailure = userLocationFailure else {
            return
        }
        userLocationFailure()
    }
}
