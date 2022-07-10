//
//  ContentView.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-06.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        
        // Detect authorization status of geolocating the user
        if model.authorizationState == CLAuthorizationStatus.notDetermined{
            // Undetermined -> Onboarding
            
        }
        else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse{
            // Approved -> Homeview
            HomeView()
        }
        else{
            // Denied -> DeniedView
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
