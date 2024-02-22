//
//  DataService.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business]{
        
        // 0. Check if API key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // 1. Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=12") {
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            // 3. Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                
                let result = try decoder.decode(BusinessSearch.self, from: data)
                
                return result.businesses
                
            }
            catch {
                print(error)
            }
        }
        
       return [Business]()
        
        
    }
    
}
