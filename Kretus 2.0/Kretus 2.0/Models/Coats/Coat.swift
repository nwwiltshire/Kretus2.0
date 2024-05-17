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
    
    func calcKits(squareFt: Int, covRate: Int, products: [Product]) {
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
