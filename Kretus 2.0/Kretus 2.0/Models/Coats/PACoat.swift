//
//  PACoat.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/20/24.
//

import Foundation

class PACoat: Coat {
    
    @Published var coatType: PACoat.CoatType
    @Published var subType: PACoat.SubType
    
    @Published var speed: PACoat.Speed
    @Published var covRate: Int
    
    @Published var partA: Product
    @Published var partB: Product
    
    @Published var coatColorant: PACoat.CoatColorant
    @Published var colorant: Product
    @Published var texture: Texture
    
    @Published var thickness: PACoat.Thickness
    
    @Published var solventCleaner: Bool
    @Published var mattingAdditive: Bool
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: PACoat.CoatType,
         subType: PACoat.SubType,
         speed: PACoat.Speed,
         covRate: Int,
         partA: Product,
         partB: Product,
         coatColorant: PACoat.CoatColorant,
         colorant: Product,
         texture: Texture,
         thickness: PACoat.Thickness,
         wasteFactor: Int,
         solventCleaner: Bool,
         mattingAdditive: Bool) {
        
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
        self.covRate = covRate
        self.partA = partA
        self.partB = partB
        self.coatColorant = coatColorant
        self.colorant = colorant
        self.texture = texture
        self.thickness = thickness
        self.solventCleaner = solventCleaner
        self.mattingAdditive = mattingAdditive
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.coatType = .base
        self.subType = .poly72
        self.speed = .ez
        self.covRate = 0 // set to default value for default thickness
        self.partA = Product()
        self.partB = Product()
        self.coatColorant = .noColor
        self.colorant = Product()
        self.texture = .noTexture
        self.thickness = .base
        self.solventCleaner = false
        self.mattingAdditive = false
        
        super.init(id: 0,
                   name: "Polyaspartic",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, top1, top2, coat1, coat2, coat3
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top1: return "Top Coat"
            case .top2: return "Top Coat 2"
            case .coat1: return "Coat 1"
            case .coat2: return "Coat 2"
            case .coat3: return "Coat 3"
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
        case poly72, poly85, poly92LO
        
        var id: Self {self}
        
        var description: String {
            switch self {
                
            case .poly72: return "Polyaspartic 72"
            case .poly85: return "Polyaspartic 85"
            case .poly92LO: return "Polyaspartic 92 Low Odor"
                
            }
        }
    }
    
    enum CoatColorant: CaseIterable, Identifiable, CustomStringConvertible {
        case noColor, beige, black, darkGray, enchantedGreen, handicapBlue, Latte, lightGray, mediumGray,
             mocha, safetyBlue, safetyRed, safetyYellow, shadowGray, tan, tileRed, white
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .noColor: return "No Color (Pre-pigmented Part A)"
            case .beige: return "Beige Colorant"
            case .black: return "Black Colorant"
            case .darkGray: return "Dark Gray Colorant"
            case .enchantedGreen: return "Enchanted Green Colorant"
            case .handicapBlue: return "Handicap Blue Colorant"
            case .Latte: return "Latte Colorant"
            case .lightGray: return "Light Gray Colorant"
            case .mediumGray: return "Medium Gray Colorant"
            case .mocha: return "Mocha Colorant"
            case .safetyBlue: return "Safety Blue Colorant"
            case .safetyRed: return "Safety Red Colorant"
            case .safetyYellow: return "Safety Yellow Colorant"
            case .shadowGray: return "Shadow Gray Colorant"
            case .tan: return "Tan Colorant"
            case .tileRed: return "Tile Red Colorant"
            case .white: return "White Colorant"
                
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, top1, top2
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .base: return "8-12 mils"
            case .prime: return "4-5 mils"
            case .top1: return "8-12 mils"
            case .top2: return "4-5 mils"
                
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
        case .base:
            covRate = 165
        case .prime:
            covRate = 350
        case .top1:
            covRate = 185
        case .top2:
            covRate = 350
        }
    }
    
    override func setValues() {
        
        updateCovRate()
        var availableProductsTS = loadPaList()
        
        findProducts(products: availableProductsTS)
        
        availableProductsTS.removeAll()
        
        // Update Later to sqft/gal
        calcKitsPerKit(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
    }

    override func findProducts(products: [Product]) {
        
        var textureProduct: Product = Product()
        
        switch self.subType {
        case .poly72:
            
            self.partB = products.first(where: {$0.id == "EX-KPLY72AF-01"})!
            
            switch self.speed {
            case .ez:
                self.partA = products.first(where: {$0.id == "EX-KPLY72AZ-01"})!
            case .fast:
                self.partA = products.first(where: {$0.id == "EX-KPLY72AF-01"})!
            }
        case .poly85:
            
            self.partB = products.first(where: {$0.id == "EX-KPLY85B-01"})!
            
            switch self.speed {
            case .ez:
                self.partA = products.first(where: {$0.id == "EX-KPLY85AZ-01"})!
            case .fast:
                self.partA = products.first(where: {$0.id == "EX-KPLY85AF-01"})!
            }
        case .poly92LO:
            
            self.partB = products.first(where: {$0.id == "EX-KPLY92B-01"})!
            
            switch self.speed {
            case .ez:
                self.partA = products.first(where: {$0.id == "EX-KPLY92AZ-01"})!
            case .fast:
                self.partA = products.first(where: {$0.id == "EX-KPLY92AF-01"})!
            }
        }
        
        switch self.coatColorant {
        case .noColor:
            self.colorant = Product()
        case .beige:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLBG-EA"})!
        case .black:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLBL-EA"})!
        case .darkGray:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLDG-EA"})!
        case .enchantedGreen:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLEG-EA"})!
        case .handicapBlue:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLHB-EA"})!
        case .Latte:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLLT-EA"})!
        case .lightGray:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLLG-EA"})!
        case .mediumGray:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLMG-EA"})!
        case .mocha:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLMC-EA"})!
        case .safetyBlue:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLSB-EA"})!
        case .safetyRed:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLSR-EA"})!
        case .safetyYellow:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLSY-EA"})!
        case .shadowGray:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLSG-EA"})!
        case .tan:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLTN-EA"})!
        case .tileRed:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLTR-EA"})!
        case .white:
            self.colorant = products.first(where: {$0.id == "EX-KPLYCLWH-EA"})!
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
        
        if (self.colorant.id != "Default") {
            productsNeeded.append(colorant)
        }
        
        if (self.texture != .noTexture) {
            productsNeeded.append(textureProduct)
        }
        
        if (self.solventCleaner) {
            productsNeeded.append(Product(id: "Solvent Cleaner", name: "Solvent Cleaner"))
        }
        
        if (self.mattingAdditive) {
            productsNeeded.append(Product(id: "Matting Additive", name: "Matting Additive"))
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
        output += "Colorant: \(colorant)\n"
        output += "Thickness: \(thickness)\n"
        output += "Waste Factor: \(wasteFactor)\n"
        return output
    }
}
