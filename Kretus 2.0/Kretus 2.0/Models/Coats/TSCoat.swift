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
    
    @Published var selectedPartA: TSCoat.PartAs
    
    @Published var partA: Product
    @Published var partB: Product
    
    @Published var coatColorant: TSCoat.CoatColorant
    @Published var colorant: Product
    
    @Published var thickness: TSCoat.Thickness
    
    init(id: Int,
         name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: TSCoat.CoatType,
         speed: TSCoat.Speed,
         covRate: Int,
         selectedPartA: TSCoat.PartAs,
         partA: Product,
         partB: Product,
         coatColorant: TSCoat.CoatColorant,
         colorant: Product,
         thickness: TSCoat.Thickness,
         wasteFactor: Int) {
        
        self.coatType = coatType
        self.speed = speed
        self.covRate = covRate
        self.selectedPartA = selectedPartA
        self.partA = partA
        self.partB = partB
        self.coatColorant = coatColorant
        self.colorant = colorant
        self.thickness = thickness
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
        self.coatType = .base
        self.speed = .ap
        self.covRate = 235 // Default .base coverage rate
        self.selectedPartA = .arBeige
        self.partA = Product()
        self.partB = Product()
        self.coatColorant = .noColor
        self.colorant = Product()
        self.thickness = .base
        
        super.init(id: 0,
                   name: "Default",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, top, mvr
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            case .mvr: return "MVR Coat"
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
            case .th: return "TH (idk yet)"
            case .mvrEz: return "MVR - EZ"
            case .mvrFc: return "MVR - FC"
                
            }
        }
    }
    
    enum PartAs: CaseIterable, Identifiable, CustomStringConvertible {
        case arBeige, arBlack, arClear, arDarkGrey, arEnchantedGreen, arHandicapBlue, arLatte,
             arLightGray, arMediumGray, arMocha, arSafetyBlue, arSafetyRed, arSafetyYellow,
             arShadowGray, arTan, arTileRed, arWhite, crrClear, lgrClear, commercial
        
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
            case .beige: return "Beige (TS)"
            case .black: return "Black (TS)"
            case .darkGray: return "Dark Gray (TS)"
            case .enchantedGreen: return "Enchanted Green (TS)"
            case .handicapBlue: return "Handicap Blue (TS)"
            case .Latte: return "Latte (TS)"
            case .lightGray: return "Light Gray (TS)"
            case .mediumGray: return "Medium Gray (TS)"
            case .mocha: return "Mocha (TS)"
            case .safetyBlue: return "Safety Blue (TS)"
            case .safetyRed: return "Safety Red (TS)"
            case .safetyYellow: return "Safety Yellow (TS)"
            case .shadowGray: return "Shadow Gray (TS)"
            case .tan: return "Tan (TS)"
            case .tileRed: return "Tile Red (TS)"
            case .white: return "White (TS)"
                
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, mvr
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .base: return "8-12 mils"
            case .prime: return "3-5 mils"
            case .mvr: return "16 mils"
                
            }
        }
    }
    
    private func updateCovRate() {
        switch coatType {
        case .base:
            covRate = 235
        case .prime:
            covRate = 275
        case .top:
            break
        case .mvr:
            covRate = 100
        }
    }
    
    override func setValues() {
        
        updateCovRate()
        var availableProductsTS = loadTsList()
        
        findProducts(products: availableProductsTS)
        
        availableProductsTS.removeAll()
        
        calcKits(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
    }

    
    override func findProducts(products: [Product]) {
        
        switch self.selectedPartA {
        case .arBeige:
            self.partA = products.first(where: {$0.id == "EX-KTSARBG-01"})!
        case .arBlack:
            self.partA = products.first(where: {$0.id == "EX-KTSARBL-01"})!
        case .arClear:
            self.partA = products.first(where: {$0.id == "EX-KTSARCL-01"})!
        case .arDarkGrey:
            self.partA = products.first(where: {$0.id == "EX-KTSARDG-01"})!
        case .arEnchantedGreen:
            self.partA = products.first(where: {$0.id == "EX-KTSAREG-01"})!
        case .arHandicapBlue:
            self.partA = products.first(where: {$0.id == "EX-KTSARHB-01"})!
        case .arLatte:
            self.partA = products.first(where: {$0.id == "EX-KTSARLT-01"})!
        case .arLightGray:
            self.partA = products.first(where: {$0.id == "EX-KTSARLG-01"})!
        case .arMediumGray:
            self.partA = products.first(where: {$0.id == "EX-KTSARMG-01"})!
        case .arMocha:
            self.partA = products.first(where: {$0.id == "EX-KTSARMH-01"})!
        case .arSafetyBlue:
            self.partA = products.first(where: {$0.id == "EX-KTSARSB-01"})!
        case .arSafetyRed:
            self.partA = products.first(where: {$0.id == "EX-KTSARSR-01"})!
        case .arSafetyYellow:
            self.partA = products.first(where: {$0.id == "EX-KTSARSY-01"})!
        case .arShadowGray:
            self.partA = products.first(where: {$0.id == "EX-KTSARSG-01"})!
        case .arTan:
            self.partA = products.first(where: {$0.id == "EX-KTSARTN-01"})!
        case .arTileRed:
            self.partA = products.first(where: {$0.id == "EX-KTSARTR-01"})!
        case .arWhite:
            self.partA = products.first(where: {$0.id == "EX-KTSARWH-01"})!
        case .crrClear:
            self.partA = products.first(where: {$0.id == "EX-KTSEMVZB-EA"})!
        case .lgrClear:
            self.partA = products.first(where: {$0.id == "Contact Distributor lg"})!
        case .commercial:
            self.partA = products.first(where: {$0.id == "FG-TSECMRCLR-01G"})!
        }
        
        switch self.speed {
        case .ap:
            self.partB = products.first(where: {$0.id == "EX-KTSEAPB-EA"})!
        case .ez:
            self.partB = products.first(where: {$0.id == "EX-KTSEZB-EA"})!
        case .fast:
            self.partB = products.first(where: {$0.id == "EX-KTSEFB-EA"})!
        case .th:
            self.partB = products.first(where: {$0.id == "EX-KTSETHB-EA"})!
        case .mvrEz:
            self.partB = products.first(where: {$0.id == "EX-KTSEMVZB-EA"})!
        case .mvrFc:
            self.partB = products.first(where: {$0.id == "EX-KTSEMVFB-EA"})!
        }
        
        switch self.coatColorant {
        case .noColor:
            self.colorant = Product()
        case .beige:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLBG-EA"})!
        case .black:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLBL-EA"})!
        case .darkGray:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLDG-EA"})!
        case .enchantedGreen:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLEG-EA"})!
        case .handicapBlue:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLHB-EA"})!
        case .Latte:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLLT-EA"})!
        case .lightGray:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLLG-EA"})!
        case .mediumGray:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLMG-EA"})!
        case .mocha:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLMC-EA"})!
        case .safetyBlue:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLSB-EA"})!
        case .safetyRed:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLSR-EA"})!
        case .safetyYellow:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLSY-EA"})!
        case .shadowGray:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLSG-EA"})!
        case .tan:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLTN-EA"})!
        case .tileRed:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLTR-EA"})!
        case .white:
            self.colorant = products.first(where: {$0.id == "EX-KTSECLWH-EA"})!
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        
        if (self.colorant.id != "Default") {
            productsNeeded.append(colorant)
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
        output += "Waste Factor: \(wasteFactor)\n"
        return output
    }
}
