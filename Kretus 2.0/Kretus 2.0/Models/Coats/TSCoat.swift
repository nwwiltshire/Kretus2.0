//
//  TSCoat.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/20/24.
//

import Foundation

class TSCoat: Coat {
    
    @Published var coatType: TSCoat.CoatType
    
    @Published var speed: TSCoat.Speed
    @Published var covRate: Int
    
    @Published var sqftPerGal: Double
    @Published var kitSize: Double
    
    @Published var selectedPartA: TSCoat.PartAs
    
    @Published var partA: Product
    @Published var partB: Product
    
    @Published var coatColorant: TSCoat.CoatColorant
    @Published var colorant: Product
    
    @Published var thickness: TSCoat.Thickness
    @Published var coveHeight: EpoxyCoveSystem.Height
    
    @Published var solventCleaner: Bool
    @Published var mattingAdditive: Bool
    
    @Published var hasColorQuartz: Bool
    @Published var texture: Texture
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: TSCoat.CoatType,
         speed: TSCoat.Speed,
         covRate: Int,
         sqftPerGal: Double,
         kitSize: Double,
         selectedPartA: TSCoat.PartAs,
         partA: Product,
         partB: Product,
         coatColorant: TSCoat.CoatColorant,
         colorant: Product,
         thickness: TSCoat.Thickness,
         coveHeight: EpoxyCoveSystem.Height,
         wasteFactor: Int,
         solventCleaner: Bool,
         mattingAdditive: Bool,
         hasColorQuartz: Bool,
         texture: Texture) {
        
        self.coatType = coatType
        self.speed = speed
        self.covRate = covRate
        self.sqftPerGal = sqftPerGal
        self.kitSize = kitSize
        self.selectedPartA = selectedPartA
        self.partA = partA
        self.partB = partB
        self.coatColorant = coatColorant
        self.colorant = colorant
        self.thickness = thickness
        self.coveHeight = coveHeight
        self.solventCleaner = solventCleaner
        self.mattingAdditive = mattingAdditive
        self.hasColorQuartz = hasColorQuartz
        self.texture = texture
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.coatType = .base
        self.speed = .ap
        self.covRate = 0
        self.sqftPerGal = 1
        self.kitSize = 1.5
        self.selectedPartA = .arBeige
        self.partA = Product()
        self.partB = Product()
        self.coatColorant = .noColor
        self.colorant = Product()
        self.thickness = .base
        self.coveHeight = .na
        self.solventCleaner = false
        self.mattingAdditive = false
        self.hasColorQuartz = false
        self.texture = .noTexture
        
        super.init(id: 0,
                   name: "Top Shelf Epoxy",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        case base, base1, base2, prime, top, mvr, coat1, coat2, coat3, body, cap, metallicBase, metallicAccent, metallicTop
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .base1: return "Base Coat 1"
            case .base2: return "Base Coat 2"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            case .mvr: return "MVR Coat"
            case .coat1: return "Coat 1"
            case .coat2: return "Coat 2"
            case .coat3: return "Coat 3"
            case .body: return "Body Coat"
            case .cap: return "Cap Coat"
            case .metallicBase: return "Metallic Base Coat"
            case .metallicAccent: return "Metallic Accent Coat"
            case .metallicTop: return "Top Coat"
            }
        }
    }
    
    enum Speed: CaseIterable, Identifiable, CustomStringConvertible {
        case ap, ez, fast, th, mvrEz, mvrFc
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ap: return "AP (Average Pace)"
            case .ez: return "EZ (Easy)"
            case .fast: return "Fast (Low Temps)"
            case .th: return "TH (Traditional)"
            case .mvrEz: return "MVR - EZ"
            case .mvrFc: return "MVR - FC"
                
            }
        }
    }
    
    enum PartAs: CaseIterable, Identifiable, CustomStringConvertible {
        case arBeige, arBlack, arClear, arDarkGrey, arEnchantedGreen, arHandicapBlue, arLatte,
             arLightGray, arMediumGray, arMocha, arSafetyBlue, arSafetyRed, arSafetyYellow,
             arShadowGray, arTan, arTileRed, arWhite, crrClear, lgrClear, commercial, coveResin
        
        var id: Self {self}
        
        var description: String {
            switch self {
                
            case .arBeige: return "A Resin - Beige"
            case .arBlack: return "A Resin - Black"
            case .arClear: return "A Resin - Clear"
            case .arDarkGrey: return "A Resin - Dark Gray"
            case .arEnchantedGreen: return "A Resin - Enchanted Green"
            case .arHandicapBlue: return "A Resin - Handicap Blue"
            case .arLatte: return "A Resin - Latte"
            case .arLightGray: return "A Resin - Light Gray"
            case .arMediumGray: return "A Resin - Medium Gray"
            case .arMocha: return "A Resin - Mocha"
            case .arSafetyBlue: return "A Resin - Safety Blue"
            case .arSafetyRed: return "A Resin - Safety Red"
            case .arSafetyYellow: return "A Resin - Safety Yellow"
            case .arShadowGray: return "A Resin - Shadow Gray"
            case .arTan: return "A Resin - Tan"
            case .arTileRed: return "A Resin - Tile Red"
            case .arWhite: return "A Resin - White"
            case .crrClear: return "CR Resin - Clear"
            case .lgrClear: return "LG Resin - Clear"
            case .commercial: return "Commercial Resin"
            case .coveResin: return "Cove Resin - Clear"
                
            }
        }
    }
    
    enum CoatColorant: CaseIterable, Identifiable, CustomStringConvertible {
        case noColor, beige, black, darkGray, enchantedGreen, handicapBlue, Latte, lightGray, mediumGray,
             mocha, safetyBlue, safetyRed, safetyYellow, shadowGray, tan, tileRed, white, metallic
        
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
            case .metallic: return "Metallic Pigment"
                
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, primeThin, mvrThin, base2, mvr, mvrPrime, fourIn, sixIn, wftThin, wftMedium, wftThick
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .base: return "8-12 mils"
            case .prime: return "3-5 mils"
            case .primeThin: return "8 mils"
            case .mvrThin: return "12 mils"
            case .base2: return "13-15 mils"
            case .mvr: return "16 mils"
            case .mvrPrime: return "5 mils"
            case .fourIn: return "4\""
            case .sixIn: return "6\""
            case .wftThin: return "15-20 WFT"
            case .wftMedium: return "25-30 WFT"
            case .wftThick: return "40-45 WFT"
                
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
    
    private func updateCovRate() {
        
        switch thickness {
        case .base:
            sqftPerGal = 100
        case .prime:
            break
        case .mvr:
            break
        case .fourIn:
            break
        case .sixIn:
            break
        case .mvrPrime:
            break
        case .mvrThin:
            break
        case .base2:
            break
        case .primeThin:
            break
        case .wftThin:
            break
        case .wftMedium:
            break
        case .wftThick:
            break
        }
        
        covRate = Int(kitSize * sqftPerGal)
        
    }
    
    override func setValues() {
        
        updateCovRate()
        
        findProducts()
        
        calcKits(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
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
        output += "Waste Factor: \(wasteFactor)\n"
        return output
    }
}
