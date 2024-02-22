//
//  ContentView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import SwiftUI

struct HomeView: View {

    @Environment(BusinessModel.self) var businessModel
    @State var selectedTab = 0
    
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
            
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                
                Text("Map")
                    .tag(1)
                
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selectedTab == 1 {
                MapView()
            }
            else {
                ListView()
            }
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
    HomeView()
        .environment(BusinessModel())
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
