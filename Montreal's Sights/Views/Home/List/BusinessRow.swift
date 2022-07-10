//
//  BusinessRow.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-10.
//

import SwiftUI

struct BusinessRow: View {
    
    // Observed to wait for image, business row reacts when image is received
    @ObservedObject var business: Business
    
    var body: some View {
        VStack(alignment: .leading){
            // Image
            let uiImage = UIImage(data: business.imageData ?? Data())
            Image(uiImage: uiImage ?? UIImage())
                .resizable()
                .frame(width:50, height: 50)
                .cornerRadius(10)
                .scaledToFit()
            
            // Name and distance
            HStack{
                VStack(alignment: .leading){
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format:"%.1f km away", (business.distance ?? 0)/1000))
                        .font(.caption)
                }
            }
            
            Spacer()
            
            // Star rating and number of reviews
            VStack(alignment: .leading){
                Image("regular_\(business.rating ?? 0)")
                Text("\(business.reviewCount ?? 0) reviews")
                    .font(.caption)
            }
        }
    }
}
