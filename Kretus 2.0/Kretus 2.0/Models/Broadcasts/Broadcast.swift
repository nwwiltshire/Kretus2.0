//
//  Broadcast.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation

class Broadcast: ObservableObject {
    
    var name: String
    var squareFt: Int
    
    @Published var covRate: Int
    @Published var productsNeeded: [Product]
    @Published var kitsNeeded: [Kit]
    
    @Published var wasteFactor: Int
    
    init(name: String,
         squareFt: Int,
         covRate: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         wasteFactor: Int) {
        
        self.name = name
        self.squareFt = squareFt
        self.covRate = covRate
        self.productsNeeded = productsNeeded
        self.kitsNeeded = kitsNeeded
        self.wasteFactor = wasteFactor
        
    }
    
    func printBroadcastTest() -> String {
        
        var output = ""
        output += "Coat Name: \(name)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Coverage rate: \(covRate)"
        output += "Products Needed: \(productsNeeded)\n"
        output += "Kits Needed: \(kitsNeeded)\n"
        output += "Waste Factor: \(wasteFactor)\n"
        return output
        
    }
    
    
    func calcKitsPerKit(squareFt: Int, covRate: Int, products: [Product]) {
      kitsNeeded.removeAll()
      
      for product in products {
        // Calculate quantity using ceil to round up
        let quantity = Int(ceil(Double(squareFt) / Double(covRate))) + wasteFactor
        
        // Create a Kit object and append it to the kitsNeeded array
        kitsNeeded.append(Kit(product: product, quantity: quantity))
      }
    }


    
    func findProducts(products: [Product]) {
        
        // Switch to find products
        
    }
    
    func setValues() {
        
        // Call necessary functions to properly set coat values
        
    }
}
