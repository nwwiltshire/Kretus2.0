//
//  UPC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/20/24.
//

import Foundation

class UPCCoat: Coat {
    
    @Published var coatType: UPCSystem.CoatType {
        didSet {
            updateCovRate()
        }
    }
    
    @Published var subType: UPCSystem.SubType
    @Published var speed: UPCSystem.Speed
    @Published var covRate: Int
    
    @Published var partA: Product
    @Published var partB: Product
    @Published var partC: Product
    
    @Published var coatColor: UPCSystem.SystemColor
    @Published var colorant: Product
    
    @Published var thickness: UPCSystem.Thickness {
            didSet {
                updateCovRate()
            }
        }
    
    @Published var wasteFactor: Int
    @Published var texture1: UPCSystem.Texture
    @Published var texture2: UPCSystem.Texture
    
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
         covRate: Int,
         partA: Product,
         partB: Product,
         partC: Product,
         coatColor: UPCSystem.SystemColor,
         colorant: Product,
         thickness: UPCSystem.Thickness,
         wasteFactor: Int,
         texture1: UPCSystem.Texture,
         texture2: UPCSystem.Texture) {
        
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
        self.covRate = covRate
        self.partA = partA
        self.partB = partB
        self.partC = partC
        self.coatColor = coatColor
        self.colorant = colorant
        self.wasteFactor = wasteFactor
        self.thickness = thickness
        self.texture1 = texture1
        self.texture2 = texture2
        
        super.init(id: id, name: name, squareFt: squareFt, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded)
        
    }
    
    init() {
        
        self.coatType = .base
        self.subType = .rc
        self.speed = .ap
        self.covRate = 0 // set to default value for default thickness
        self.partA = Product()
        self.partB = Product()
        self.partC = Product()
        self.coatColor = .unpigmented
        self.colorant = Product()
        self.wasteFactor = 0
        self.thickness = .thinRC
        self.texture1 = .none
        self.texture2 = .none
        
        super.init(id: 0,
                   name: "Default",
                   squareFt: 0,
                   productsNeeded: [],
                   kitsNeeded: [])
    }
    
    private func updateCovRate() {
        switch coatType {
        case .base:
            switch subType {
            case .rc:
                switch thickness {
                case .thinRC:
                    covRate = 1 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 2
                case .thickRC:
                    covRate = 3
                case .thin:
                    covRate = 4
                case .medium:
                    covRate = 5
                case .thick:
                    covRate = 6
                }
            case .tt:
                switch thickness {
                case .thinRC:
                    covRate = 7 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 8
                case .thickRC:
                    covRate = 9
                case .thin:
                    covRate = 10
                case .medium:
                    covRate = 11
                case .thick:
                    covRate = 12
                }
            case .sl:
                switch thickness {
                case .thinRC:
                    covRate = 13 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 14
                case .thickRC:
                    covRate = 15
                case .thin:
                    covRate = 16
                case .medium:
                    covRate = 17
                case .thick:
                    covRate = 18
                }
            case .mf:
                switch thickness {
                case .thinRC:
                    covRate = 19 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 20
                case .thickRC:
                    covRate = 21
                case .thin:
                    covRate = 22
                case .medium:
                    covRate = 23
                case .thick:
                    covRate = 24
                }
            }
        case .prime:
            switch subType {
            case .rc:
                switch thickness {
                case .thinRC:
                    covRate = 25 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 26
                case .thickRC:
                    covRate = 27
                case .thin:
                    covRate = 28
                case .medium:
                    covRate = 29
                case .thick:
                    covRate = 30
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
                    covRate = 49 // set these variables to correct values later vv
                case .mediumRC:
                    covRate = 50
                case .thickRC:
                    covRate = 51
                case .thin:
                    covRate = 52
                case .medium:
                    covRate = 53
                case .thick:
                    covRate = 54
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
        }
    }
    
    override func setValues() {
        
        updateCovRate()
        var availableProductsUPC = loadUpcList()
        
        findProducts(products: availableProductsUPC)
        
        availableProductsUPC.removeAll()
        
        calcKits(squareFt: squareFt, covRate: covRate, products: productsNeeded)
        
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
        output += "Coverage Rate: \(covRate)\n"
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
