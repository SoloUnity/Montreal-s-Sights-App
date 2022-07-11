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
                
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
            
        }
        return annotations
    }
    
    //Creates UI View
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator  //Assign delegate object to mapView, mapView informs delegate object on tap, lets system handle coordinator objects
        
        //Make the use show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        return mapView
    }
        
    // Called several times as data changes,
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the ones based on the business
        
        uiView.showAnnotations(self.locations, animated: true) // Adds and zooms as opposed to just add from the bottom
        
        // uiView.addAnnotations(self.locations)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }
    
    // MARK: Coordinator class
    // Func gets automatically called when new instance of Coordinator class is made
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        
            
        // AnnotationView, displays above the pin
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // If annotation is user blue dot, return nil, otherwise it is gone
            if annotation is MKUserLocation{
                return nil
            }
            
            // Check if there's a reusable annotation view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil{
                
                // Create new annotation view
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true //Callout information
                
                annotationView!.rightCalloutAccessoryView = UIButton(type:.detailDisclosure) // Little i information circle
            }
            else{
                // Reusable annotation view, Reuses the red pins of one location elsewhere to save memory
                annotationView!.annotation = annotation
            }
            
            // Return it
            return annotationView
            
        
        }
        
    }
}

