//
//  product.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

struct Product: Codable {
    
    var id: String = "Default"
    var name: String = "Default"

}

struct Kit {
    
    var product: Product
    var quantity: Int = 0
    
}

