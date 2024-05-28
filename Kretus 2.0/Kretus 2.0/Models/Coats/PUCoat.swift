//
//  PUCoat.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation

class PUCoat: Coat {
    
    @Published var coatType: PUCoat.CoatType
    @Published var subType: PUCoat.SubType
    
    @Published var speed: PUCoat.Speed
    @Published var covRate: Int
    
    @Published var partA: Product
    @Published var partB: Product
    @Published var texture: Texture
    
    @Published var thickness: PUCoat.Thickness
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: PUCoat.CoatType,
         subType: PUCoat.SubType,
         speed: PUCoat.Speed,
         covRate: Int,
         partA: Product,
         partB: Product,
         texture: Texture,
         thickness: PUCoat.Thickness,
         wasteFactor: Int) {
        
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
        self.covRate = covRate
        self.partA = partA
        self.partB = partB
        self.texture = texture
        self.thickness = thickness
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.coatType = .base
        self.subType = .polyHS
        self.speed = .ez
        self.covRate = 0 // set to default value for default thickness
        self.partA = Product()
        self.partB = Product()
        self.texture = .noTexture
        self.thickness = .top2
        
        super.init(id: 0,
                   name: "Polyurethane",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, top1, top2
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top1: return "Top Coat"
            case .top2: return "Top Coat 2"
            }
        }
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
        case top2
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .top2: return "3-5 mils"
                
            }
        }
    }
    
    enum Texture: CaseIterable, Identifiable, CustomStringConvertible {
        case noTexture, asAo120, asAo220, asAo60, asAo80, asB100, asB50
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .noTexture: return "No Texture"
            case .asAo120: return "Anti-Slip Aluminum Oxide 120 Grit"
            case .asAo220: return "Anti-Slip Aluminum Oxide 220 Grit"
            case .asAo60: return "Anti-Slip Aluminum Oxide 60 Grit"
            case .asAo80: return "Anti-Slip Aluminum Oxide 80 Grit"
            case .asB100: return "Anti-Slip Bead 100"
            case .asB50: return "Anti-Slip Bead 50"
            }
            
        }
    }
    
    // Update later (SQFT/GAL)
    private func updateCovRate() {
        switch self.thickness {
        case .top2:
            covRate = 100
        }
    }
    
    override func setValues() {
        
        updateCovRate()
        
        findProducts()
        
        // Update Later to sqft/gal
        calcKitsPerKit(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
    }

    // First attempt at new product method, might implement for all later.
    // Implementation: Make extension, get rid of override in parent
    func findProducts() {
        
        var textureProduct: Product = Product()
        
        switch self.subType {
        case .polyHS:
            
            self.partB = Product(id: "EX-KPLYHSB-EA",
                                 name: "Polyurethane HS: Part B, 1/2 gal")
            
            switch self.speed {
            case .ez:
                self.partA = Product(id: "EX-KPLYHSAZ-01",
                                     name: "Polyurethane HS: EZ - Clear, 1 gal")
            case .fast:
                self.partA = Product(id: "EX-KPLYHSAF-01",
                                     name: "Polyurethane HS: FC - Clear, 1 gal")
            }
            
        case .polyHPcg:
            
            self.partA = Product(id: "EX-KPLYHPGA-EA",
                                 name: "Polyurethane HP Clear Gloss: Fast - Clear, 32 oz")
            self.partB = Product(id: "EX-KPLYHPB-01",
                                 name: "Polyurethane HP Clear Gloss: Part B, 1 gal")
            
        case .polyHPcs:
            
            self.partA = Product(id: "EX-KPLYHPSA-EA",
                                 name: "Polyurethane HP Clear Satin: Fast - Clear, 1/2 gal")
            self.partB = Product(id: "EX-KPLYHPB-01",
                                 name: "Polyurethane HP Clear Satin: Part B, 1 gal")
            
        }
        
        switch self.texture {
        case .noTexture:
            textureProduct = Product()
        case .asAo120:
            textureProduct = Product(id: "Contact Distributor", name: "\(texture.description), 10#")
        case .asAo220:
            textureProduct = Product(id: "Contact Distributor", name: "\(texture.description), 10#")
        case .asAo60:
            textureProduct = Product(id: "Contact Distributor", name: "\(texture.description), 10#")
        case .asAo80:
            textureProduct = Product(id: "Contact Distributor", name: "\(texture.description), 10#")
        case .asB100:
            textureProduct = Product(id: "Contact Distributor", name: "\(texture.description), 32 oz")
        case .asB50:
            textureProduct = Product(id: "Contact Distributor", name: "\(texture.description), 32 oz")
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        
        if (self.texture != .noTexture) {
            productsNeeded.append(textureProduct)
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
