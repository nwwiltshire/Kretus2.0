//
//  UPC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/20/24.
//

import Foundation

class UPCCoat: Coat {
    
    @Published var subType: UPCSystem.SubType
    @Published var speed: Speed
    
    @Published var partA: Product
    @Published var partB: Product
    @Published var partC: Product
    
    @Published var coatColor: UPCSystem.SystemColor
    @Published var colorant: Product
    
    @Published var thickness: Thickness {
            didSet {
                updateCovRate()
            }
        }
    
    @Published var texture1: Texture
    @Published var texture2: Texture
    @Published var uvResistance: Bool
    
    @Published var solventCleaner: Bool
    @Published var mattingAdditive: Bool
    
    @Published var coveHeight: UPCCoveSystem.Height
    
    // Coverage Rate (focus is more on just how much product you need)
    // Coverage Rate is only dependent on thickness
    
    init(name: String,
         squareFt: Int,
         productsNeeded: [Product],
         kitsNeeded: [Kit],
         coatType: Coat.CoatType,
         subType: UPCSystem.SubType,
         speed: Speed,
         covRate: Int,
         partA: Product,
         partB: Product,
         partC: Product,
         coatColor: UPCSystem.SystemColor,
         colorant: Product,
         thickness: Thickness,
         texture1: Texture,
         texture2: Texture,
         uvResistance: Bool,
         wasteFactor: Int,
         solventCleaner: Bool,
         mattingAdditive: Bool,
         coveHeight: UPCCoveSystem.Height) {
        
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
        self.solventCleaner = solventCleaner
        self.mattingAdditive = mattingAdditive
        self.coveHeight = coveHeight
        
        super.init(name: name, squareFt: squareFt, covRate: covRate, coatType: coatType, productsNeeded: productsNeeded, kitsNeeded: kitsNeeded, wasteFactor: wasteFactor)
        
    }
    
    init() {
        
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
        self.solventCleaner = false
        self.mattingAdditive = false
        self.coveHeight = .na
        
        super.init(name: "UPC",
                   squareFt: 0,
                   covRate: 190, // set to default value for default thickness
                   coatType: .base,
                   productsNeeded: [],
                   kitsNeeded: [],
                   wasteFactor: 0)
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case prime, thinRC, mediumRC, thickRC, quartzTT, thin, medium, thick, primeRC
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .prime: return "3-5 mils"
            case .thinRC: return "8-12 mils"
            case .mediumRC: return "15-20 mils"
            case .thickRC: return "25-30 mils"
            case .quartzTT: return "3/8\""
            case .thin: return "1/8\""
            case .medium: return "3/16\""
            case .thick: return "1/4\""
            case .primeRC: return "5-7 mils"
            }
        }
    }
    
    enum Speed: CaseIterable, Identifiable, CustomStringConvertible {
        case ez, ap, fc
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ez: return "EZ (Easy)"
            case .ap: return "AP (Average Pace)"
            case .fc: return "FC (Fast Cure)"
            }
        }
    }
    
    enum Texture: CaseIterable, Identifiable, CustomStringConvertible {
        case none, antiSlip60, antiSlip36, antiSlip24, industrialSand60, industrialSand30, industrialSand20
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "No Texture"
            case .antiSlip60: return "Anti Slip 60"
            case .antiSlip36: return "Anti Slip 36"
            case .antiSlip24: return "Anti Slip 24"
            case .industrialSand60: return "Industrial Sand 60"
            case .industrialSand30: return "Industrial Sand 30"
            case .industrialSand20: return "Industrial Sand 20"
            }
        }
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        case base, base1, base2, prime, top, coat1, body, cap, mvr
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .base1: return "Base Coat 1"
            case .base2: return "Base Coat 2"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            case .coat1: return "Coat 1"
            case .body: return "Body Coat"
            case .cap: return "Cap Coat"
            case .mvr: return "MVR Coat"
            }
        }
    }
    
    private func updateCovRate() {
        /*
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
                // 0's because switch statements must be exhaustive
                case .thin:
                    covRate = 1
                case .medium:
                    covRate = 1
                case .thick:
                    covRate = 1
                case .quartzTT:
                    break
                case .primeRC:
                    break
                }
            case .tt:
                switch thickness {
                // 0's because switch statements must be exhaustive
                case .thinRC:
                    covRate = 1
                case .mediumRC:
                    covRate = 1
                case .thickRC:
                    covRate = 1
                case .thin:
                    covRate = 24
                case .medium:
                    covRate = 14
                case .thick:
                    covRate = 10
                case .quartzTT:
                    break
                case .primeRC:
                    break
                }
            case .sl:
                switch thickness {
                case .thinRC:
                    covRate = 1
                case .mediumRC:
                    covRate = 1
                case .thickRC:
                    covRate = 1
                case .thin:
                    covRate = 50
                case .medium:
                    covRate = 35
                case .thick:
                    covRate = 25
                case .quartzTT:
                    break
                case .primeRC:
                    break
                }
            case .mf:
                switch thickness {
                case .thinRC:
                    covRate = 1
                case .mediumRC:
                    covRate = 1
                case .thickRC:
                    covRate = 1
                case .thin:
                    covRate = 60
                case .medium:
                    covRate = 35
                case .thick:
                    covRate = 25
                case .quartzTT:
                    break
                case .primeRC:
                    break
                }
            case .wcvc:
                break
            case .rcuv:
                break
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
                    covRate = 1
                case .medium:
                    covRate = 1
                case .thick:
                    covRate = 1
                case .quartzTT:
                    break
                case .primeRC:
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
                case .quartzTT:
                    break
                case .primeRC:
                    break
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
                case .quartzTT:
                    break
                case .primeRC:
                    break
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
                case .quartzTT:
                    break
                case .primeRC:
                    break
                }
            case .wcvc:
                break
            case .rcuv:
                break
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
                    covRate = 1
                case .medium:
                    covRate = 1
                case .thick:
                    covRate = 1
                case .quartzTT:
                    break
                case .primeRC:
                    break
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
                case .quartzTT:
                    break
                case .primeRC:
                    break
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
                case .quartzTT:
                    break
                case .primeRC:
                    break
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
                case .quartzTT:
                    break
                case .primeRC:
                    break
                }
            case .wcvc:
                break
            case .rcuv:
                break
            }
        case .coat1:
            break
        case .body:
            break
        case .cap:
            break
        case .mvr:
            break
        case .base1:
            break
        case .base2:
            break
        }
         */
    }
    
    override func setValues() {
        
        updateCovRate()
        
        findProducts()
        
        calcKits(squareFt: squareFt, covRate: covRate, products: productsNeeded, additiveCovRate: covRate)
        
    }

    override func printCoatTest() -> String {
        
        var output = ""
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
}
