//
//  upcRC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

class Coat: ObservableObject {
    
    var name: String
    var squareFt: Int
    
    @Published var covRate: Int
    @Published var coatType: CoatType
    @Published var productsNeeded: [Product]
    @Published var kitsNeeded: [Kit]
    
    @Published var wasteFactor: Int
    
    init(name: String,
         squareFt: Int,
         covRate: Int,
         coatType: CoatType,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         wasteFactor: Int) {
        
        self.name = name
        self.squareFt = squareFt
        self.covRate = covRate
        self.coatType = coatType
        self.productsNeeded = productsNeeded
        self.kitsNeeded = kitsNeeded
        self.wasteFactor = wasteFactor
        
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        
        case prime, conductivePrimer, mvr, body, metallicBody, base, base1, base2, metallicBase, metallicAccent, cap, top, top1, top2, metallicTop, coat1, coat2, coat3
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .prime: return "Prime Coat"
            case .conductivePrimer: return "Conductive Primer"
            case .mvr: return "MVR Coat"
            case .body: return "Body Coat"
            case .metallicBody: return "Metallic Body"
            case .base: return "Base Coat"
            case .base1: return "Base Coat 1"
            case .base2: return "Base Coat 2"
            case .metallicBase: return "Metallic Base"
            case .metallicAccent: return "Metallic Accent"
            case .cap: return "Cap Coat"
            case .top: return "Top Coat"
            case .top1: return "Top Coat 1"
            case .top2: return "Top Coat 2"
            case .metallicTop: return "Metallic Top"
            case .coat1: return "Coat 1"
            case .coat2: return "Coat 2"
            case .coat3: return "Coat 3"
            }
        }
    }
    
    func printCoatTest() -> String {
        
        var output = ""
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
