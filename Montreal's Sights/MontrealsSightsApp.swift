//
//  MontrealsSightsApp.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-06.
//

import SwiftUI

@main
struct MontrealsSightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
