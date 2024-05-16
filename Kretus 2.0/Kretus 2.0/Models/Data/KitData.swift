//
//  UPCKitData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/19/24.
//

import Foundation
import SwiftData

@Model
final class KitData {
    let id: String
    let name: String
    let quantity: Int
        
    init(id: String, name: String, quantity: Int) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
    
    // Possibly Implement later
    enum KitType: CaseIterable, Codable, Identifiable, CustomStringConvertible {
        case base, prime, top, texture, colorant, accelerant
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            case .texture: return "Texture"
            case .colorant: return "Colorant"
            case .accelerant: return "Accelerant"
            }
        }
    }
}
