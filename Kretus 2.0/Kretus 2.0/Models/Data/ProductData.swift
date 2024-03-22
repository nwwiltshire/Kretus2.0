//
//  UPCProductData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/19/24.
//

import Foundation
import SwiftData

@Model
final class ProductData {
    let id: String
    let name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    init() {
        self.id = "Default ID"
        self.name = "Default Name"
    }
    
}

