//
//  ContentView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    @State var yelpSearch: String = ""
    var service = DataService()
    
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("What are you looking for?", text: $yelpSearch)
                Button {
                    
                } label: {
                    Text("Go")
                        .padding()
                }
            }
            
            List (businesses) { business in
            
                Text(business.name ?? "Nil")
                
            }
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
