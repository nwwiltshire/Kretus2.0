//
//  product.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

struct Product: Identifiable {
    
    var id: String = "Default"
    var name: String = "Default"
    var type: ProductType = .other

    enum ProductType: CaseIterable, Identifiable, CustomStringConvertible {
        case ts, pa, pu, upc, additive, select, other
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ts: return "Top Shelf Epoxy"
            case .pa: return "Polyaspartic"
            case .pu: return "Polyurethane"
            case .upc: return "Urethane Polymer Concrete"
            case .additive: return "Additive"
            case .select: return "Select Line"
            case .other: return "Other"
            }
        }
    }
    
}
