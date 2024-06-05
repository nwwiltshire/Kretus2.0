//
//  UPCProducts.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/5/24.
//

import Foundation

extension UPCCoat {
    func findProducts(products: [Product]) {
        
        switch self.subType {
            
            case .rc:
                
            self.partA = Product(id: "EX-KUPCARC-EA", name: "UPC Part A: RC/TT, 6 lbs")
            self.partC = Product(id: "EX-KUPCRFC-EA", name: "UPC Part C: RC, 6 lbs")
            
            switch self.speed {
                
                case .ez:
                
                self.partB = Product(id: "EX-KUPCRCZ6-EA", name: "UPC Part B: RC/TT - EZ, 6 lbs")
                
                case .ap:
                
                self.partB = Product(id: "EX-KUPCRCA6-EA", name: "UPC Part B: RC/TT - AP, 6 lbs")
                
                case .fc:
                
                self.partB = Product(id: "EX-KUPCRCF6-EA", name: "UPC Part B: RC/TT - FC, 6 lbs")
                
            }
            
            case .tt:
            
            self.partA = Product(id: "EX-KUPCARC-EA", name: "UPC Part A: RC/TT, 6 lbs")
            self.partC = Product(id: "EX-KUPCTTC4-EA", name: "UPC Part C: TT, 6 lbs")
            
            switch self.speed {
                
                case .ez:
                
                self.partB = Product(id: "EX-KUPCRCZ6-EA", name: "UPC Part B: RC/TT - EZ, 6 lbs")
                
                case .ap:
                
                self.partB = Product(id: "EX-KUPCRCA6-EA", name: "UPC Part B: RC/TT - AP, 6 lbs")
                
                case .fc:
                
                self.partB = Product(id: "EX-KUPCRCF6-EA", name: "UPC Part B: RC/TT - FC, 6 lbs")
                
            }
                
            case .sl:
            
            self.partA = Product(id: "EX-KUPCASL8-EA", name: "UPC Part A: SL/MF, 8 lbs")
            self.partC = Product(id: "EX-KUPCSLC2-EA", name: "UPC Part C: SL, 25 lbs")
            
            switch self.speed {
                
                case .ez:
                
                self.partB = Product(id: "EX-KUPCSLZ8-EA", name: "UPC Part B: SL/MF - EZ, 8 lbs")
                
                case .ap:
                
                self.partB = Product(id: "EX-KUPCSLB8-EA", name: "UPC Part B: SL/MF - AP, 8 lbs")
                
                case .fc:
                
                self.partB = Product(id: "EX-KUPCSLF8-EA", name: "UPC Part B: SL/MF - FC, 8 lbs")
                
            }
                
            case .mf:
            
            self.partA = Product(id: "EX-KUPCASL8-EA", name: "UPC Part A: SL/MF, 8 lbs")
            self.partC = Product(id: "EX-KUPCMFC-EA", name: "UPC Part C: MF, 40 lbs")
            
            switch self.speed {
                
                case .ez:
                
                self.partB = Product(id: "EX-KUPCSLZ8-EA", name: "UPC Part B: SL/MF - EZ, 8 lbs")
                
                case .ap:
                
                self.partB = Product(id: "EX-KUPCSLB8-EA", name: "UPC Part B: SL/MF - AP, 8 lbs")
                
                case .fc:
                
                self.partB = Product(id: "EX-KUPCSLF8-EA", name: "UPC Part B: SL/MF - FC, 8 lbs")
                
            }
        case .wcvc:
            break
        }
        
        switch self.coatColor {
        case .unpigmented:
            self.colorant = Product()
        case .black:
            self.colorant = Product(id: "EX-KUPCCLBK-EA", name: "EX-KUPCCLBK-EA")
        case .blue:
            self.colorant = Product(id: "EX-KUPCCLBL-EA", name: "EX-KUPCCLBL-EA")
        case .bone:
            self.colorant = Product(id: "EX-KUPCCLWG-EA", name: "EX-KUPCCLWG-EA")
        case .brown:
            self.colorant = Product(id: "EX-KUPCCLBR-EA", name: "EX-KUPCCLBR-EA")
        case .clay:
            self.colorant = Product(id: "EX-KUPCCLCL-EA", name: "EX-KUPCCLCL-EA")
        case .gray:
            self.colorant = Product(id: "EX-KUPCCLGY-EA", name: "EX-KUPCCLGY-EA")
        case .green:
            self.colorant = Product(id: "EX-KUPCCLGR-EA", name: "EX-KUPCCLGR-EA")
        case .mustard:
            self.colorant = Product(id: "EX-KUPCCLCY-EA", name: "EX-KUPCCLCY-EA")
        case .red:
            self.colorant = Product(id: "EX-KUPCCLRD-EA", name: "EX-KUPCCLRD-EA")
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        productsNeeded.append(partC)
        
        if (self.colorant.id != "Default") {
            productsNeeded.append(colorant)
        }
        
        if (self.coatType == .top) {
            
            switch texture1 {
            case .none:
                break
            case .antiSlip60:
                productsNeeded.append(Product(id: "EX-KASAO60-01", name: "Anti-Slip A.O. 60, 10 lbs"))
            case .antiSlip36:
                productsNeeded.append(Product(id: "EX-KASAO36-01", name: "Anti-Slip A.O. 36, 10 lbs"))
            case .antiSlip24:
                productsNeeded.append(Product(id: "EX-KASA246-01", name: "Anti-Slip A.O. 24, 10 lbs"))
            case .industrialSand60:
                productsNeeded.append(Product(id: "116", name: "Industrial Sand #60"))
            case .industrialSand30:
                productsNeeded.append(Product(id: "115", name: "Industrial Sand #30"))
            case .industrialSand20:
                productsNeeded.append(Product(id: "114", name: "Industrial Sand #20"))
            }
            
        }
        
        if (self.uvResistance == true) {
            productsNeeded.append(Product(id: "EX-KPACEL-08", name: "Poly Accelerant, 8 oz"))
        }
        
        if (self.solventCleaner) {
            productsNeeded.append(Product(id: "Solvent Cleaner ID", name: "Solvent Cleaner"))
        }

    }
}
