//
//  PUCoat.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation

class PUCoat: Coat {
    
    @Published var subType: SubType
    
    @Published var speed: Speed
    
    @Published var sqftPerGal: Double
    @Published var kitSize: Double
    
    @Published var partA: Product
    @Published var partB: Product
    @Published var texture: Texture
    
    @Published var thickness: Thickness
    
    @Published var solventCleaner: Bool
    @Published var mattingAdditive: Bool
    
    init(name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: Coat.CoatType,
         subType: SubType,
         speed: Speed,
         covRate: Int,
         sqftPerGal: Double,
         kitSize: Double,
         partA: Product,
         partB: Product,
         texture: Texture,
         thickness: Thickness,
         wasteFactor: Int,
         solventCleaner: Bool,
         mattingAdditive: Bool) {
        
        self.subType = subType
        self.speed = speed
        self.sqftPerGal = sqftPerGal
        self.kitSize = kitSize
        self.partA = partA
        self.partB = partB
        self.texture = texture
        self.thickness = thickness
        self.solventCleaner = solventCleaner
        self.mattingAdditive = mattingAdditive
        
        super.init(name: name, squareFt: squareFt, covRate: covRate, coatType: coatType, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.subType = .polyHS
        self.speed = .ez
        self.sqftPerGal = 1
        self.kitSize = 1.5
        self.partA = Product()
        self.partB = Product()
        self.texture = .noTexture
        self.thickness = .top2
        self.solventCleaner = false
        self.mattingAdditive = false
        
        super.init(name: "Polyurethane",
                   squareFt: 0,
                   covRate: 0, // Set to default thickness later
                   coatType: .base,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum Speed: CaseIterable, Identifiable, CustomStringConvertible {
        case ez, fast
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ez: return "EZ - Clear"
            case .fast: return "Fast - Clear"
                
            }
        }
    }
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case polyHS, polyHPcg, polyHPcs
        
        var id: Self {self}
        
        var description: String {
            switch self {
                
            case .polyHS: return "Polyurethane HS"
            case .polyHPcg: return "Polyurethane HP Clear Gloss"
            case .polyHPcs: return "Polyurethane HP Clear Satin"
                
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case base, top2
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .base: return "8-12 mils"
            case .top2: return "3-5 mils"
                
            }
        }
    }
    
    enum Texture: CaseIterable, Identifiable, CustomStringConvertible {
        case noTexture, asAo60, asAo80, asAo120, asAo220, asB100, asB50, asT50
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .noTexture: return "No Texture"
            case .asAo60: return "Anti-Slip Aluminum Oxide 60 Grit"
            case .asAo80: return "Anti-Slip Aluminum Oxide 80 Grit"
            case .asAo120: return "Anti-Slip Aluminum Oxide 120 Grit"
            case .asAo220: return "Anti-Slip Aluminum Oxide 220 Grit"
            case .asB100: return "Anti-Slip Bead 100"
            case .asB50: return "Anti-Slip Bead 50"
            case .asT50: return "Anti-Slip Tex 50"
            }
            
        }
    }
    
    // Update later (SQFT/GAL)
    private func updateCovRate() {
        switch self.thickness {
        case .top2:
            sqftPerGal = 100
        case .base:
            break
        }
        
        covRate = Int(sqftPerGal * kitSize)
        
    }
    
    override func setValues() {
        
        updateCovRate()
        
        findProducts()
        
        // Update Later to sqft/gal
        calcKits(squareFt: squareFt, covRate: covRate, products: productsNeeded, additiveCovRate: Int(sqftPerGal))
        
    }

    override func printCoatTest() -> String {
        
        var output = ""
        output += "Coat Name: \(name)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Products Needed: \(productsNeeded)\n"
        output += "Kits Needed: \(kitsNeeded)\n"
        output += "Coat Type: \(coatType)\n"
        output += "Speed: \(speed)\n"
        output += "Coverage Rate: \(covRate)\n"
        output += "Part A: \(partA)\n"
        output += "Part B: \(partB)\n"
        output += "Thickness: \(thickness)\n"
        output += "Texture: \(texture)"
        output += "Waste Factor: \(wasteFactor)\n"
        return output
    }
}
