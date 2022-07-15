//
//  YelpAttribution.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-14.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link:String
    
    var body: some View {
        
        Link(destination: URL(string:link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height:36)
        }
    }
}


