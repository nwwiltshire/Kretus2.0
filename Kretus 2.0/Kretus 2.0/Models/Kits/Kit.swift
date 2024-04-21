//
//  Kits.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/11/24.
//

import Foundation

struct Kit: Identifiable {
    
    var id = UUID()
    
    var product: Product
    var quantity: Int = 0
        
}
