//
//  MapView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(BusinessModel.self) var businessModel
    @State var selectedBusinessId: String?
    
    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(businessModel.businesses, id: \.id) { b in
                Marker(b.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0,
                                                                                  longitude: b.coordinates?.longitude ?? 0))
                .tag(b.id ?? "None")
            }
        }
            .onChange(of: selectedBusinessId) { oldValue, newValue in
                let business = businessModel.businesses.first { business in
                    business.id == selectedBusinessId
                }
                
                if business != nil {
                    businessModel.selectedBusiness = business!
                }
            }
            
        }
}

#Preview {
    MapView()
        .environment(BusinessModel())
}
