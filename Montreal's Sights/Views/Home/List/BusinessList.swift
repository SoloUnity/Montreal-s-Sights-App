//
//  BusinessList.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-09.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        ScrollView{
            
            
            
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){
                BusinessSection(title: "Restauraunts", businesses: model.restaurants)
                
                BusinessSection(title: "Sights", businesses: model.sights)
                
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
