//
//  LocationManager.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import CoreLocation
import Foundation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    
    static let shared = LocationManager()
    
     func getCurrentLocation(completion: @escaping(CLLocation) -> Void) {
        
        self.locationFetchCompletion = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        locationFetchCompletion?(location)
        manager.stopUpdatingLocation()
    }
    
}
