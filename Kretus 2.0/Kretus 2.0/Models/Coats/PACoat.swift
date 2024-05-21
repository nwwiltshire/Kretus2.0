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
    
    @Published var thickness: TSCoat.Thickness
    
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
         thickness: TSCoat.Thickness,
         wasteFactor: Int) {
        
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
        self.covRate = covRate
        self.partA = partA
        self.partB = partB
        self.coatColorant = coatColorant
        self.colorant = colorant
        self.thickness = thickness
        
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
        self.thickness = .base
        
        super.init(id: 0,
                   name: "Default",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
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
            case .beige: return "Beige"
            case .black: return "Black"
            case .darkGray: return "Dark Gray"
            case .enchantedGreen: return "Enchanted Green"
            case .handicapBlue: return "Handicap Blue"
            case .Latte: return "Latte"
            case .lightGray: return "Light Gray"
            case .mediumGray: return "Medium Gray"
            case .mocha: return "Mocha"
            case .safetyBlue: return "Safety Blue"
            case .safetyRed: return "Safety Red"
            case .safetyYellow: return "Safety Yellow"
            case .shadowGray: return "Shadow Gray"
            case .tan: return "Tan"
            case .tileRed: return "Tile Red"
            case .white: return "White"
                
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, top1
        
        var id: Self { self }
        
        var description: String {
            switch self {
                
            case .base: return "8-12 mils"
            case .prime: return "2-3 mils"
            case .top1: return "8-12 mils"
                
            }
        }
    }
    
    
    /*
    private func updateCovRate() {
        switch coatType {
        case .base:
            switch subType {
            case .rc:
                switch thickness {
                case .thinRC:
                    covRate = 190
                case .mediumRC:
                    covRate = 120
                case .thickRC:
                    covRate = 80
                case .thin:
                    break
                case .medium:
                    break
                case .thick:
                    break
                }
            case .tt:
                switch thickness {
                case .thinRC:
                    break
                case .mediumRC:
                    break
                case .thickRC:
                    break
                case .thin:
                    covRate = 24
                case .medium:
                    covRate = 14
                case .thick:
                    covRate = 10
                }
            case .sl:
                switch thickness {
                case .thinRC:
                    break
                case .mediumRC:
                    break
                case .thickRC:
                    break
                case .thin:
                    covRate = 50
                case .medium:
                    covRate = 35
                case .thick:
                    covRate = 25
                }
            case .mf:
                switch thickness {
                case .thinRC:
                    break
                case .mediumRC:
                    break
                case .thickRC:
                    break
                case .thin:
                    covRate = 60
                case .medium:
                    covRate = 35
                case .thick:
                    covRate = 25
                }
            }
        case .prime:
            switch subType {
            case .rc:
                switch thickness {
                case .thinRC:
                    covRate = 190
                case .mediumRC:
                    covRate = 120
                case .thickRC:
                    covRate = 80
                case .thin:
                    break
                case .medium:
                    break
                case .thick:
                    break
                }
            case .tt:
                switch thickness {
                case .thinRC:
                    covRate = 31 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 32
                case .thickRC:
                    covRate = 33
                case .thin:
                    covRate = 34
                case .medium:
                    covRate = 35
                case .thick:
                    covRate = 36
                }
            case .sl:
                switch thickness {
                case .thinRC:
                    covRate = 37 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 38
                case .thickRC:
                    covRate = 39
                case .thin:
                    covRate = 40
                case .medium:
                    covRate = 41
                case .thick:
                    covRate = 42
                }
            case .mf:
                switch thickness {
                case .thinRC:
                    covRate = 43 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 44
                case .thickRC:
                    covRate = 45
                case .thin:
                    covRate = 46
                case .medium:
                    covRate = 47
                case .thick:
                    covRate = 48
                }
            }
        case .top:
            switch subType {
            case .rc:
                switch thickness {
                case .thinRC:
                    covRate = 190
                case .mediumRC:
                    covRate = 120
                case .thickRC:
                    covRate = 80
                case .thin:
                    covRate = 0
                case .medium:
                    covRate = 0
                case .thick:
                    covRate = 0
                }
            case .tt:
                switch thickness {
                case .thinRC:
                    covRate = 55 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 56
                case .thickRC:
                    covRate = 57
                case .thin:
                    covRate = 58
                case .medium:
                    covRate = 59
                case .thick:
                    covRate = 60
                }
            case .sl:
                switch thickness {
                case .thinRC:
                    covRate = 61 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 62
                case .thickRC:
                    covRate = 63
                case .thin:
                    covRate = 64
                case .medium:
                    covRate = 65
                case .thick:
                    covRate = 66
                }
            case .mf:
                switch thickness {
                case .thinRC:
                    covRate = 67 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 68
                case .thickRC:
                    covRate = 69
                case .thin:
                    covRate = 70
                case .medium:
                    covRate = 71
                case .thick:
                    covRate = 72
                }
            }
        case .mvr:
            switch thickness {
            case .thinRC:
                covRate = 0
            case .mediumRC:
                covRate = 0
            case .thickRC:
                covRate = 0
            case .thin:
                covRate = 0
            case .medium:
                covRate = 0
            case .thick:
                covRate = 0
            }
        }
    }
     */
    
    override func setValues() {
        
        //updateCovRate()
        var availableProductsTS = loadTsList()
        
        findProducts(products: availableProductsTS)
        
        availableProductsTS.removeAll()
        
        calcKits(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
    }

    /*
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
     */

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
