//
//  TextHelper.swift
//  CitySights App
//
//  Created by Matthew Dembinski on 2/8/24.
//

import Foundation

struct TextHelper {
    
    static func distnaceAwayText(meters: Double) -> String {
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        }
        else {
            return "\(Int(round(meters))) m away"
        }
        
    }

    static func ratingImageCalculator(rating: Double) -> String {
        
        
        switch rating {
        case 0:
            return "regular_0"
        case 1:
            return "regular_1.0"
        case 1.1...1.5:
            return "regular_1.5"
        case 1.51...2.0:
            return "regular_2.0"
        case 2.1...2.5:
            return "regular_2.5"
        case 2.6...3.0:
            return "regular_3.0"
        case 3.1...3.5:
            return "regular_3.5"
        case 3.5...4.0:
            return "regular_4.0"
        case 4.1...4.5:
            return "regular_4.5"
        case 4.6...5.0:
            return "regular_5.0"
            
        default:
            return "regula_0"
        }
    }
}

