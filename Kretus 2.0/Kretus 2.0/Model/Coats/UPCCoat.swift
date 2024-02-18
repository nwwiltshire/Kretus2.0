//
//  UPC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/20/24.
//

import Foundation

class UPCCoat: Coat {
    
    var subType: UPCSystem.SubType
    var speed: UPCSystem.Speed
    
    var partA: Product
    var partB: Product
    var partC: Product
    
    init(id: Int,
         name: String,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         subType: UPCSystem.SubType,
         speed: UPCSystem.Speed,
         partA: Product,
         partB: Product,
         partC: Product) {
        
        self.subType = subType
        self.speed = speed
        self.partA = partA
        self.partB = partB
        self.partC = partC
        
        super.init(id: id, name: name, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded)
        
    }
    
    init() {
        
        self.subType = .rc
        self.speed = .ap
        self.partA = Product()
        self.partB = Product()
        self.partC = Product()
        
        super.init(id: 0,
                   name: "Default",
                   productsNeeded: [],
                   kitsNeeded: [])
    }
    
    enum CoatType {
        case base, prime, top
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            }
        }
    }

    
    override func findProductsABC() {
        
        switch self.subType {
            
            case .rc:
                
            self.partA = upcList.first(where: {$0.id == "EX-KUPCARC-E"})!
            self.partC = upcList.first(where: {$0.id == "EX-KUPCRFC-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCRCZ6-EA"})!
                
                case .ap:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCRCA6-EA"})!
                
                case .fc:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCRCF6-EA"})!
                
            }
            
            case .tt:
            
            self.partA = upcList.first(where: {$0.id == "EX-KUPCARC-E"})!
            self.partC = upcList.first(where: {$0.id == "EX-KUPCTTC4-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCRCZ6-EA"})!
                
                case .ap:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCRCA6-EA"})!
                
                case .fc:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCRCF6-EA"})!
                
            }
                
            case .sl:
            
            self.partA = upcList.first(where: {$0.id == "EX-KUPCASL8-EA"})!
            self.partC = upcList.first(where: {$0.id == "EX-KUPCSLC2-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCSLZ8-EA"})!
                
                case .ap:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCSLB8-EA"})!
                
                case .fc:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCSLF8-EA"})!
                
            }
                
            case .mf:
            
            self.partA = upcList.first(where: {$0.id == "EX-KUPCASL8-EA"})!
            self.partC = upcList.first(where: {$0.id == "EX-KUPCMFC-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCSLZ8-EA"})!
                
                case .ap:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCSLB8-EA"})!
                
                case .fc:
                
                self.partB = upcList.first(where: {$0.id == "EX-KUPCSLF8-EA"})!
                
            }
        }
    }
    
    override func findProductsColorant() {
        
        // switch to find products
        
    }
    
    override func calcKits(squareFeet: Int) {
        
        // This will replace quant function
        
    }
}
