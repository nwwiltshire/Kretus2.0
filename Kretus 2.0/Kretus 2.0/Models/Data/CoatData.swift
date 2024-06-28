//
//  CoatData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation
import SwiftData

@Model
final class CoatData {
    let coatType: String
    let coatProduct: String
    let covRate: Int
    
    var kits: [CoatKitRelationship]
    
    init(coatType: String, coatProduct: String, covRate: Int, kits: [CoatKitRelationship]) {
        self.coatType = coatType
        self.coatProduct = coatProduct
        self.covRate = covRate
        self.kits = kits
    }
}
