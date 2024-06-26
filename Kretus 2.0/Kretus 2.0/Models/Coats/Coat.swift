//
//  upcRC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

class Coat: ObservableObject {
    
    let id: Int
    var name: String
    var squareFt: Int
    
    @Published var productsNeeded: [Product]
    @Published var kitsNeeded: [Kit]
    
    @Published var wasteFactor: Int
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         wasteFactor: Int) {
        
        self.id = id
        self.name = name
        self.squareFt = squareFt
        self.productsNeeded = productsNeeded
        self.kitsNeeded = kitsNeeded
        self.wasteFactor = wasteFactor
        
    }
    
    func printCoatTest() -> String {
        
        var output = ""
        output += "Coat ID: \(id)\n"
        output += "Coat Name: \(name)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Products Needed: \(productsNeeded)\n"
        output += "Kits Needed: \(kitsNeeded)\n"
        output += "Waste Factor: \(wasteFactor)\n"
        return output
        
    }
    
    func calcKits(squareFt: Int, covRate: Int, products: [Product], additiveCovRate: Int) {
        
        kitsNeeded.removeAll()
        
        var quantity = 0
      
        for product in products {
            
            if (product.type != .additive) {
                  
                // Calculate quantity using ceil to round up
                quantity = Int(ceil(Double(squareFt) / Double(covRate))) + wasteFactor
                  
            } else {
                  
                quantity = Int(ceil(Double(squareFt) / Double(additiveCovRate))) + wasteFactor
                  
            }
              
            // Create a Kit object and append it to the kitsNeeded array
            kitsNeeded.append(Kit(product: product, quantity: quantity))
          
      }
    }
    
    // PA, PU, TS, ConductivePrimer: Add kit size variable and sqft/gal variable, (sqftPerGal * kitsize) = covRate (Ignore solvent cleaners, matting additives, etc. match these to part A (sqft/gal))
    
    
    func setValues() {
        
        // Call necessary functions to properly set coat values
        
    }
}
