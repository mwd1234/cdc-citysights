//
//  ContentView.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var yelpSearch: String = ""
    var service = DataService()
    
    
    var body: some View {
        HStack {
            TextField("What are you looking for?", text: $yelpSearch)
            Button {
                
            } label: {
                Text("Go")
                    .padding()
            }
        }
        .padding()
        .task {
            await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
