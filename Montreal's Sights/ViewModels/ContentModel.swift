//
//  ContentModel.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-06.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override init(){
        
        // Reference the init within the NSObject
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
        // Start geolocating the user
        
    }
    
    // MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse{
            // We have permission -> Start updating location
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied{
            
            // No permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user in coords, meters per second and time
        print(locations.first ?? "no location")
        
        // Stop requesting location (if we only need it once)
        locationManager.stopUpdatingLocation()
    }
}
