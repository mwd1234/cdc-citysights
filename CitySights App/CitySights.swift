//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import SwiftUI

@main
struct CitySights: App {
    
    @State var businessModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
        }
    }
}
