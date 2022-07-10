//
//  HomeView.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-09.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0{
            
            // Determine if we should show list or map
            if !isMapShowing{
                // Show list
                VStack{
                    HStack{
                        Image(systemName: "location")
                        Text("Montreal")
                        Spacer()
                        Text("Switch to map view")
                    }
                    Divider()
                    BusinessList()
                }
                .padding([.horizontal, .top])
            }
            else{
                // Show map
                
            }
        }
        else{
            // Waiting for data -> Loading spinner
            ProgressView()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
