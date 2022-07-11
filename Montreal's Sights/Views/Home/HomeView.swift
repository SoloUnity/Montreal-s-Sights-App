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
    @State var selectedBusiness:Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0{
            
            NavigationView{
                // Determine if we should show list or map
                if !isMapShowing{
                    // Show list
                    VStack{
                        HStack{
                            Image(systemName: "location")
                            Text("Montreal")
                            Spacer()
                            Button("Switch to map view"){
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else{
                    // Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            
                            // Create a business detail view instance
                            // Pass in selected business
                            BusinessDetail(business: business)
                        }
                }
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
