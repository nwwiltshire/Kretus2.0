//
//  IndustrialSandBroadcast.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/6/24.
//

import Foundation

class IndustrialSandBroadcast: Broadcast {
    
    @Published var sand: Sand
    
    init(name: String,
         squareFt: Int,
         covRate: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         sand: Sand,
         wasteFactor: Int) {
        
        self.sand = sand
        
        super.init(name: name, squareFt: squareFt, covRate: covRate, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
    }
    
    init() {
        
        self.sand = .twentyMesh
        
        super.init(name: "Industrial Sand",
                   squareFt: 1,
                   covRate: 1, // Set to default later
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum Sand: CaseIterable, Identifiable, CustomStringConvertible {
        
        case twentyMesh, thirtyMesh, sixtyMesh
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .twentyMesh: return "20 Mesh"
            case .thirtyMesh: return "30 Mesh"
            case .sixtyMesh: return "60 Mesh"
                
            }
        }
        
    }
    
    private func updateCoveRate() {
        // figure out logic later
    }
    
    override func setValues() {
        updateCoveRate()
        
        findProducts()
        
        calcKitsPerKit(squareFt: squareFt, covRate: covRate, products: productsNeeded)
    }
    
    override func findProducts() {
        
        var broadcastProduct: Product = Product()
        
        switch self.sand {
        case .twentyMesh:
            broadcastProduct = Product(id: "id", name: "20 Mesh")
        case .thirtyMesh:
            broadcastProduct = Product(id: "id", name: "30 Mesh")
        case .sixtyMesh:
            broadcastProduct = Product(id: "id", name: "60 Mesh")
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(broadcastProduct)
        
    }
    
}
