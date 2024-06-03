//
//  ColorChipBroadcast.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation

class ColorChipBroadcast: Broadcast {
    
    @Published var thickness: Thickness
    @Published var grade: Grade
    
    init(name: String,
         squareFt: Int,
         covRate: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         thickness: Thickness,
         grade: Grade,
         wasteFactor: Int) {
        
        self.thickness = thickness
        self.grade = grade
        
        super.init(name: name, squareFt: squareFt, covRate: covRate, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.thickness = .quarterInch
        self.grade = .none
        
        super.init(name: "Color Chip",
                   squareFt: 1,
                   covRate: 1, // Set to default later
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case quarterInch, eighthInch
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .quarterInch: return "1/4\""
            case .eighthInch: return "1/8\""
                
            }
        }
    }
    
    enum Grade: CaseIterable, Identifiable, CustomStringConvertible {
        case none, q, f, xf
        
        var id: Self { self }
        
        var description: String {
            switch self {
            
            case .none: return "None"
            case .q: return "Q-Grade"
            case .f: return "F-Grade"
            case .xf: return "XF-Grade"
                
            }
        }
    }
    
    // Update later
    private func updateCovRate() {
        switch self.thickness {
        case .quarterInch:
            covRate = 16 // update later
        case .eighthInch:
            covRate = 35 // update later
        }
    }
    
    override func setValues() {
        
        updateCovRate()
        
        findProducts()
        
        // Update Later to sqft/gal
        calcKitsPerKit(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
    }

    func findProducts() {
        
        var broadcastProduct: Product = Product()
        
        switch self.thickness {
        case .quarterInch:
            broadcastProduct = Product(id: "Contact Distributor", name: "Color Chip 1/4\" - See Kretus Color Chart, 55#")
        case .eighthInch:
            broadcastProduct = Product(id: "Contact Distributor", name: "Color Chip 1/8\" - See Kretus Color Chart, 55#")
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(broadcastProduct)

    }
}
