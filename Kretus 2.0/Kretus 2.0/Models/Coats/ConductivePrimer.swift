//
//  ConductivePrimer.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation

class ConductivePrimer: Coat {

    @Published var covRate: Int
    
    @Published var partA: Product
    @Published var partB: Product
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         covRate: Int,
         partA: Product,
         partB: Product,
         wasteFactor: Int
    ) {
        
        self.covRate = covRate
        self.partA = partA
        self.partB = partB
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.covRate = 1 // set to conductive primer coverage rate
        self.partA = Product(id: "Conductive Primer", name: "Part A")
        self.partB = Product(id: "Conductive Primer", name: "Part B")
        
        super.init(id: 0,
                   name: "Conductive Primer",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    override func setValues() {
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        
        // Update Later to sqft/gal
        calcKitsPerKit(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
    }

    override func printCoatTest() -> String {
        
        var output = ""
        output += "Coat ID: \(id)\n"
        output += "Coat Name: \(name)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Products Needed: \(productsNeeded)\n"
        output += "Kits Needed: \(kitsNeeded)\n"
        output += "Coverage Rate: \(covRate)\n"
        output += "Part A: \(partA)\n"
        output += "Part B: \(partB)\n"
        output += "Waste Factor: \(wasteFactor)\n"
        return output
    }
}
