//
//  UPC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/20/24.
//

import Foundation

class UPCCoat: Coat {
    
    @Published var coatType: UPCSystem.CoatType
    
    @Published var subType: UPCSystem.SubType
    @Published var speed: UPCSystem.Speed
    
    @Published var partA: Product
    @Published var partB: Product
    @Published var partC: Product
    
    @Published var coatColor: UPCSystem.SystemColor
    @Published var colorant: Product
    
    @Published var thickness: UPCSystem.Thickness
    
    @Published var texture1: UPCSystem.Texture
    @Published var texture2: UPCSystem.Texture
    @Published var uvResistance: Bool
    
    // Coverage Rate (focus is more on just how much product you need)
    // Coverage Rate is only dependent on thickness
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: UPCSystem.CoatType,
         subType: UPCSystem.SubType,
         speed: UPCSystem.Speed,
         partA: Product,
         partB: Product,
         partC: Product,
         coatColor: UPCSystem.SystemColor,
         colorant: Product,
         thickness: UPCSystem.Thickness,
         texture1: UPCSystem.Texture,
         texture2: UPCSystem.Texture,
         uvResistance: Bool,
         wasteFactor: Int) {
        
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
        self.partA = partA
        self.partB = partB
        self.partC = partC
        self.coatColor = coatColor
        self.colorant = colorant
        self.thickness = thickness
        self.texture1 = texture1
        self.texture2 = texture2
        self.uvResistance = uvResistance
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.coatType = .base
        self.subType = .rc
        self.speed = .ap
        self.partA = Product()
        self.partB = Product()
        self.partC = Product()
        self.coatColor = .unpigmented
        self.colorant = Product()
        self.thickness = .thinRC
        self.texture1 = .none
        self.texture2 = .none
        self.uvResistance = false
        
        super.init(id: 0,
                   name: "Default",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    override func setValues() {
        
        var availableProductsUPC = loadUpcList()
        
        findProducts(products: availableProductsUPC)
        
        availableProductsUPC.removeAll()
        
        calcKits(squareFt: squareFt, products: productsNeeded)
        
    }

    
    override func findProducts(products: [Product]) {
        
        switch self.subType {
            
            case .rc:
                
            self.partA = products.first(where: {$0.id == "EX-KUPCARC-EA"})!
            self.partC = products.first(where: {$0.id == "EX-KUPCRFC-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCRCZ6-EA"})!
                
                case .ap:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCRCA6-EA"})!
                
                case .fc:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCRCF6-EA"})!
                
            }
            
            case .tt:
            
            self.partA = products.first(where: {$0.id == "EX-KUPCARC-EA"})!
            self.partC = products.first(where: {$0.id == "EX-KUPCTTC4-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCRCZ6-EA"})!
                
                case .ap:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCRCA6-EA"})!
                
                case .fc:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCRCF6-EA"})!
                
            }
                
            case .sl:
            
            self.partA = products.first(where: {$0.id == "EX-KUPCASL8-EA"})!
            self.partC = products.first(where: {$0.id == "EX-KUPCSLC2-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCSLZ8-EA"})!
                
                case .ap:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCSLB8-EA"})!
                
                case .fc:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCSLF8-EA"})!
                
            }
                
            case .mf:
            
            self.partA = products.first(where: {$0.id == "EX-KUPCASL8-EA"})!
            self.partC = products.first(where: {$0.id == "EX-KUPCMFC-EA"})!
            
            switch self.speed {
                
                case .ez:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCSLZ8-EA"})!
                
                case .ap:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCSLB8-EA"})!
                
                case .fc:
                
                self.partB = products.first(where: {$0.id == "EX-KUPCSLF8-EA"})!
                
            }
        }
        
        switch self.coatColor {
        case .unpigmented:
            self.colorant = Product()
        case .black:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLBK-EA"})!
        case .blue:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLBL-EA"})!
        case .bone:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLWG-EA"})!
        case .brown:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLBR-EA"})!
        case .clay:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLCL-EA"})!
        case .gray:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLGY-EA"})!
        case .green:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLGR-EA"})!
        case .mustard:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLCY-EA"})!
        case .red:
            self.colorant = products.first(where: {$0.id == "EX-KUPCCLRD-EA"})!
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        productsNeeded.append(partC)
        
        if (self.colorant.id != "Default") {
            productsNeeded.append(colorant)
        }
        
        if (self.coatType == .top) {
            
            if (self.texture1 != .none) {
                productsNeeded.append(findTexture(texture: self.texture1, products: upcList))
            }
            
            if (self.texture2 != .none) {
                productsNeeded.append(findTexture(texture: self.texture2, products: upcList))
            }
            
            if (self.uvResistance == true) {
                productsNeeded.append(products.first(where: {$0.id == "EX-KPACEL-08"})!)
            }
        }

    }

    override func printCoatTest() -> String {
        
        var output = ""
        output += "Coat ID: \(id)\n"
        output += "Coat Name: \(name)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Products Needed: \(productsNeeded)\n"
        output += "Kits Needed: \(kitsNeeded)\n"
        output += "Coat Type: \(coatType)\n"
        output += "Sub Type: \(subType)\n"
        output += "Speed: \(speed)\n"
        output += "Part A: \(partA)\n"
        output += "Part B: \(partB)\n"
        output += "Part C: \(partC)\n"
        output += "Thickness: \(thickness)\n"
        output += "Waste Factor: \(wasteFactor)\n"
        output += "Texture 1: \(texture1)\n"
        output += "Texture 2: \(texture2)\n"
        return output
    }
    
    func findTexture(texture: UPCSystem.Texture, products: [Product]) -> Product {
        
        switch texture {
        case .none:
            return Product()
        case .antiSlip60:
            return products.first(where: {$0.id == "EX-KASAO60-01"})!
        case .antiSlip36:
            return products.first(where: {$0.id == "EX-KASAO36-01"})!
        case .antiSlip24:
            return products.first(where: {$0.id == "EX-KASA246-01"})!
        case .industrialSand60:
            return products.first(where: {$0.id == "116"})!
        case .industrialSand30:
            return products.first(where: {$0.id == "115"})!
        case .industrialSand20:
            return products.first(where: {$0.id == "114"})!
        }
    }
}
