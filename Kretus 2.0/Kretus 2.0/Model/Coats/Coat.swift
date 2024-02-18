//
//  upcRC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

class Coat: ObservableObject {
    
    let id: Int
    let name: String
    
    @Published var productsNeeded: [Product]
    @Published var kitsNeeded: [Kit]
    
    
    
    init(id: Int,
         name: String,
         productsNeeded: [Product],
         kitsNeeded: [Kit]) {
        
        self.id = id
        self.name = name
        self.productsNeeded = productsNeeded
        self.kitsNeeded = kitsNeeded
        
    }
    
    func findProductsABC() {
        
        // switch to find products
        
    }
    
    func findProductsColorant() {
        
        // switch to find products
        
    }
    
    func calcKits(squareFeet: Int) {
        
        // This will replace quant function
        
    }
}
