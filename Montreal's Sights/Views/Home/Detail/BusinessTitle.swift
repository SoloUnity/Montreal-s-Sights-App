//
//  BusinessTitle.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-11.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
            VStack(alignment: .leading){
                // Business Name
                Text(business.name!)
                    .font(.title)
                    .bold()

                
                // Loop through display address
                if business.location?.displayAddress != nil {
                    
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)

                    }
                }
                
                
                // Rating
                Image("regular_\(business.rating ?? 0)")

            }
        }
        
}


