//
//  ListView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/21/24.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var businessModel
    
    var body: some View {
        
        List {
            
            ForEach(businessModel.businesses) { business in
                VStack (spacing: 20) {
                    
                    HStack (spacing: 0) {
                        Image("list-placeholder-image")
                            .padding(.trailing)
                        VStack (alignment: .leading) {
                            Text(business.name ?? "Restaurant")
                                .font(Font.system(size: 15))
                                .bold()
                            Text(TextHelper.distnaceAwayText(meters: business.distance ?? 0))
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        Image(TextHelper.ratingImageCalculator(rating: business.rating ?? 0))
                    }
                    Divider()
                }
                .onTapGesture {
                    businessModel.selectedBusiness = business
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environment(BusinessModel())
}
