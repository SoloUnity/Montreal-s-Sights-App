//
//  OnboardingView.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-12.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model:ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack (spacing: 20){
            
            TabView(selection: $tabSelection){
                // First tab
                VStack{
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Welcome to Montreal Sights!")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                        
                    
                    Text("Montreal Sights helps you find the best of the city!")
                        .multilineTextAlignment(.center)
                    
                }
                .foregroundColor(.white)
                .tag(0)
                
                // Second tab
                VStack{
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Ready to discover Montreal?")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                        
                    Text("We'll show you the best restaurants, venues and more, based on your location!")
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.white)
                .tag(1)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Circle indicators
            // Button
            
            Button {
                // Detect which tab it is
                if tabSelection == 0{
                    tabSelection = 1
                }
                else{
                    // Request geolocation permission
                    model.requestGeolocationPermission()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height:48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            
            Spacer()
            
        }
        .padding()
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
