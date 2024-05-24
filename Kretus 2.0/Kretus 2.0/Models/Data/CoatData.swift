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
    let subType: String
    let speed: String
    
    init(coatType: String, subType: String, speed: String) {
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
    }
}
