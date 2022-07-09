//
//  BusinessSearch.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-08.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
