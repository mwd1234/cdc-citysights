//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}
