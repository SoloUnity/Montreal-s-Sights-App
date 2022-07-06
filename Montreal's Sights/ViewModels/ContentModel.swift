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
        let userLocation = locations.first
        
        if userLocation != nil{
            
            // We have a location
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // Send coordinates to Yelp API

            getBusinesses(category: "restaurants", location: userLocation!)
        }
        
    }
    
    func getBusinesses(category:String, location:CLLocation){
        
        // Create URL
        /*
         let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
         
         let url = URL(string: urlString)
         
         */
        
        var urlComponents = URLComponents(string:"https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        
        var url = urlComponents?.url
        
        if let url = url{
            // Create the URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"  //Endpoint type of GET from API docs
            
            //API KEY HERE
            request.addValue("Bearer ", forHTTPHeaderField: "Authorization")
            // Get URL Session
            let session = URLSession.shared
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { data, response, error in
                // Check that there isn't an error
                if error == nil{
                    print(response)
                }
            }
            // Start the Data Task
        }
        
    }
}
