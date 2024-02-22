//
//  ContentView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import SwiftUI

struct ContentView: View {

    @Environment(BusinessModel.self) var businessModel
    
    var body: some View {
        
        @Bindable var businessModel = businessModel
        
        VStack {
            
            HStack {
                TextField("What are you looking for?", text: $businessModel.yelpSearch)
                Button {
                    
                } label: {
                    Text("Go")
                        .padding()
                }
            }
            
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
        .onAppear {
            businessModel.getBusinesses()
        }
        .sheet(item: $businessModel.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    ContentView()
}


//ForEach(city.attractions) { attraction in
//    
//    NavigationLink {
//        DetailView(attraction: attraction)
//    } label: {
//        AttractionRow(attraction: attraction)
//            .padding(.bottom, 50)
//    }
//    .buttonStyle(.plain)
//}
