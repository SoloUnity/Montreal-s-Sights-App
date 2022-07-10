//
//  BusinessSectionHeader.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-09.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title:String
    
    var body: some View {
        
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
            
        }
        
    }
}


