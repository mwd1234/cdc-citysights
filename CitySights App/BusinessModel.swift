//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/21/24.
//

import Foundation
import SwiftUI


@Observable
class BusinessModel {
    
    var businesses = [Business]()
    var yelpSearch: String = ""
    var selectedBusiness: Business?
    var service = DataService()
    
    func getBusinesses() {
        
        Task {
            businesses = await service.businessSearch()
        }
    }
}
