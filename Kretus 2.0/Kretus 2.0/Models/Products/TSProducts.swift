//
//  TSProducts.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/6/24.
//

import Foundation

extension TSCoat {
    
    func findProducts() {
        
        switch self.selectedPartA {
        case .arBeige:
            self.partA = Product(id: "EX-KTSARBG-01",
                                 name: "TSE Part A: A Resin - Beige, 1 gal")
        case .arBlack:
            self.partA = Product(id: "EX-KTSARBL-01",
                                 name: "TSE Part A: A Resin - Black, 1 gal")
        case .arClear:
            self.partA = Product(id: "EX-KTSARCL-01",
                                 name: "TSE Part A: A Resin - Clear, 1 gal")
        case .arDarkGrey:
            self.partA = Product(id: "EX-KTSARDG-01",
                                 name: "TSE Part A: A Resin - Dark Gray, 1 gal")
        case .arEnchantedGreen:
            self.partA = Product(id: "EX-KTSAREG-01",
                                 name: "TSE Part A: A Resin - Enchanted Green, 1 gal")
        case .arHandicapBlue:
            self.partA = Product(id: "EX-KTSARHB-01",
                                 name: "TSE Part A: A Resin - Handicap Blue, 1 gal")
        case .arLatte:
            self.partA = Product(id: "EX-KTSARLT-01",
                                 name: "TSE Part A: A Resin - Latte, 1 gal")
        case .arLightGray:
            self.partA = Product(id: "EX-KTSARLG-01",
                                 name: "TSE Part A: A Resin - Light Gray, 1 gal")
        case .arMediumGray:
            self.partA = Product(id: "EX-KTSARMG-01",
                                 name: "TSE Part A: A Resin - Medium Gray, 1 gal")
        case .arMocha:
            self.partA = Product(id: "EX-KTSARMH-01",
                                 name: "TSE Part A: A Resin - Mocha, 1 gal")
        case .arSafetyBlue:
            self.partA = Product(id: "EX-KTSARSB-01",
                                 name: "TSE Part A: A Resin - Safety Blue, 1 gal")
        case .arSafetyRed:
            self.partA = Product(id: "EX-KTSARSR-01",
                                 name: "TSE Part A: A Resin - Safety Red, 1 gal")
        case .arSafetyYellow:
            self.partA = Product(id: "EX-KTSARSY-01",
                                 name: "TSE Part A: A Resin - Safety Yellow, 1 gal")
        case .arShadowGray:
            self.partA = Product(id: "EX-KTSARSG-01",
                                 name: "TSE Part A: A Resin - Shadow Gray, 1 gal")
        case .arTan:
            self.partA = Product(id: "EX-KTSARTN-01",
                                 name: "TSE Part A: A Resin - Tan, 1 gal")
        case .arTileRed:
            self.partA = Product(id: "EX-KTSARTR-01",
                                 name: "TSE Part A: A Resin - Tile Red, 1 gal")
        case .arWhite:
            self.partA = Product(id: "EX-KTSARWH-01",
                                 name: "TSE Part A: A Resin - White, 1 gal")
        case .crrClear:
            self.partA = Product(id: "EX-KTSEMVZB-EA",
                                 name: "TSE Part A: CR Resin - Clear, 1 gal")
        case .lgrClear:
            self.partA = Product(id: "Contact Distributor lg",
                                 name: "TSE Part A: LG Resin - Clear, 1 gal")
        case .commercial:
            self.partA = Product(id: "FG-TSECMRCLR-01G",
                                 name: "TSE Part A: Commercial Resin - Clear, 1 gal")
        case .coveResin:
            self.partA = Product(id: "Cove Resin ID",
                                 name: "Cove Resin Part A")
        }
        
        switch self.speed {
        case .ap:
            self.partB = Product(id: "EX-KTSEAPB-EA",
                                 name: "TSE Part B: AP, 1/2 gal")
        case .ez:
            self.partB = Product(id: "EX-KTSEZB-EA",
                                 name: "TSE Part B: EZ, 1/2 gal")
        case .fast:
            self.partB = Product(id: "EX-KTSEFB-EA",
                                 name: "TSE Part B: Fast, 1/2 gal")
        case .th:
            self.partB = Product(id: "EX-KTSETHB-EA",
                                 name: "TSE Part B: TH, 1/2 gal")
        case .mvrEz:
            self.partB = Product(id: "EX-KTSEMVZB-EA",
                                 name: "TSE Part B: MVR - EZ, 1/2 gal")
        case .mvrFc:
            self.partB = Product(id: "EX-KTSEMVFB-EA",
                                 name: "TSE Part B: MVR - FC, 1/2 gal")
        }
        
        switch self.coatColorant {
        case .noColor:
            self.colorant = Product()
        case .beige:
            self.colorant = Product(id: "EX-KTSECLBG-EA",
                                    name: "TSE Colorant: Beige, 16 oz")
        case .black:
            self.colorant = Product(id: "EX-KTSECLBL-EA",
                                    name: "TSE Colorant: Black, 16 oz")
        case .darkGray:
            self.colorant = Product(id: "EX-KTSECLDG-EA",
                                    name: "TSE Colorant: Dark Gray, 16 oz")
        case .enchantedGreen:
            self.colorant = Product(id: "EX-KTSECLEG-EA",
                                    name: "TSE Colorant: Enchanted Green, 16 oz")
        case .handicapBlue:
            self.colorant = Product(id: "EX-KTSECLHB-EA",
                                    name: "TSE Colorant: Handicap Blue, 16 oz")
        case .Latte:
            self.colorant = Product(id: "EX-KTSECLLT-EA",
                                    name: "TSE Colorant: Latte, 16 oz")
        case .lightGray:
            self.colorant = Product(id: "EX-KTSECLLG-EA",
                                    name: "TSE Colorant: Light Gray, 16 oz")
        case .mediumGray:
            self.colorant = Product(id: "EX-KTSECLMG-EA",
                                    name: "TSE Colorant: Medium Gray, 16 oz")
        case .mocha:
            self.colorant = Product(id: "EX-KTSECLMC-EA",
                                    name: "TSE Colorant: Mocha, 16 oz")
        case .safetyBlue:
            self.colorant = Product(id: "EX-KTSECLSB-EA",
                                    name: "TSE Colorant: Safety Blue, 16 oz")
        case .safetyRed:
            self.colorant = Product(id: "EX-KTSECLSR-EA",
                                    name: "TSE Colorant: Safety Red, 16 oz")
        case .safetyYellow:
            self.colorant = Product(id: "EX-KTSECLSY-EA",
                                    name: "TSE Colorant: Safety Yellow, 16 oz")
        case .shadowGray:
            self.colorant = Product(id: "EX-KTSECLSG-EA",
                                    name: "TSE Colorant: Shadow Gray, 16 oz")
        case .tan:
            self.colorant = Product(id: "EX-KTSECLTN-EA",
                                    name: "TSE Colorant: Tan, 16 oz")
        case .tileRed:
            self.colorant = Product(id: "EX-KTSECLTR-EA",
                                    name: "TSE Colorant: Tile Red, 16 oz")
        case .white:
            self.colorant = Product(id: "EX-KTSECLWH-EA",
                                    name: "TSE Colorant: White, 16 oz")
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        
        if (self.colorant.id != "Default") {
            productsNeeded.append(colorant)
        }
        
        if (self.solventCleaner) {
            productsNeeded.append(Product(id: "Solvent Cleaner",
                                          name: "Solvent Cleaner"))
        }
        
        if (self.mattingAdditive) {
            productsNeeded.append(Product(id: "Matting Additive",
                                          name: "Matting Additive"))
        }
        
        if (self.hasColorQuartz) {
            productsNeeded.append(Product(id: "Color Quartz",
                                          name: "Color Quartz"))
        }

    }
    
}
