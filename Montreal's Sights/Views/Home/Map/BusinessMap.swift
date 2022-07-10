//
//  BusinessMap.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-10.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable{
    
    @EnvironmentObject var model:ContentModel
    
    var locations:[MKPointAnnotation]{
        
        var annotations = [MKPointAnnotation]()
        
        // Create a set of annotations from our list of businesses
        // + simulates 2 loops
        for business in model.restaurants + model.sights{
            
            // If the business has lat long, create an MKPointAnnotation
            
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude{
                // Create a new annotation
                
                var a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                annotations.append(a)
            }
            
        }
        return annotations
    }
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        return mapView
    }
        
    // Called several times as data changes
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the ones based on the business
        
        uiView.showAnnotations(self.locations) // Adds and zooms as opposed to just add from the bottom
        
        // uiView.addAnnotations(self.locations)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }
}

