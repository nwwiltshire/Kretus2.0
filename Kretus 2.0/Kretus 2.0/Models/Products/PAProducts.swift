//
//
//  PAProducts.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/6/24.
//

import Foundation

extension PACoat {
    
    func findProducts() {
        
        var textureProduct: Product = Product()
        
        switch self.subType {
        case .poly72:
            
            self.partB = Product(id: "EX-KPLY72B-01",
                                 name: "Polyaspartic 72: Part B, 1 gal")
            
            switch self.speed {
            case .ez:
                self.partA = Product(id: "EX-KPLY72AZ-01",
                                     name: "Polyaspartic 72: EZ - Clear, 1 gal")
            case .fast:
                self.partA = Product(id: "EX-KPLY72AF-01",
                                     name: "Polyaspartic 72: FC - Clear, 1 gal")
            }
        case .poly85:
            
            self.partB = Product(id: "EX-KPLY85B-01",
                                 name: "Polyaspartic 85: Part B, 1 gal")
            
            switch self.speed {
            case .ez:
                self.partA = Product(id: "EX-KPLY85AZ-01",
                                     name: "Polyaspartic 85: EZ - Clear, 1 gal")
            case .fast:
                self.partA = Product(id: "EX-KPLY85AF-01",
                                     name: "Polyaspartic 85: FC - Clear, 1 gal")
            }
        case .poly92LO:
            
            self.partB = Product(id: "EX-KPLY92B-01",
                                 name: "Polyaspartic 92 Low Odor: Part B, 1 gal")
            
            switch self.speed {
            case .ez:
                self.partA = Product(id: "EX-KPLY92AZ-01",
                                     name: "Polyaspartic 92 Low Odor: EZ - Clear, 1 gal")
            case .fast:
                self.partA = Product(id: "EX-KPLY92AF-01",
                                     name: "Polyaspartic 92 Low Odor: FC - Clear, 1 gal")
            }
        }
        
        switch self.coatColorant {
        case .noColor:
            self.colorant = Product()
        case .beige:
            self.colorant = Product(id: "EX-KPLYCLBG-EA",
                                    name: "Poly Colorant: Beige, 16 oz")
        case .black:
            self.colorant = Product(id: "EX-KPLYCLBL-EA",
                                    name: "Poly Colorant: Black, 16 oz")
        case .darkGray:
            self.colorant = Product(id: "EX-KPLYCLDG-EA",
                                    name: "Poly Colorant: Dark Gray, 16 oz")
        case .enchantedGreen:
            self.colorant = Product(id: "EX-KPLYCLEG-EA",
                                    name: "Poly Colorant: Enchanted Green, 16 oz")
        case .handicapBlue:
            self.colorant = Product(id: "EX-KPLYCLHB-EA",
                                    name: "Poly Colorant: Handicap Blue, 16 oz")
        case .Latte:
            self.colorant = Product(id: "EX-KPLYCLLT-EA",
                                    name: "Poly Colorant: Latte, 16 oz")
        case .lightGray:
            self.colorant = Product(id: "EX-KPLYCLLG-EA",
                                    name: "Poly Colorant: Light Gray, 16 oz")
        case .mediumGray:
            self.colorant = Product(id: "EX-KPLYCLMG-EA",
                                    name: "Poly Colorant: Medium Gray, 16 oz")
        case .mocha:
            self.colorant = Product(id: "EX-KPLYCLMC-EA",
                                    name: "Poly Colorant: Mocha, 16 oz")
        case .safetyBlue:
            self.colorant = Product(id: "EX-KPLYCLSB-EA",
                                    name: "Poly Colorant: Safety Blue, 16 oz")
        case .safetyRed:
            self.colorant = Product(id: "EX-KPLYCLSR-EA",
                                    name: "Poly Colorant: Safety Red, 16 oz")
        case .safetyYellow:
            self.colorant = Product(id: "EX-KPLYCLSY-EA",
                                    name: "Poly Colorant: Safety Yellow, 16 oz")
        case .shadowGray:
            self.colorant = Product(id: "EX-KPLYCLSG-EA",
                                    name: "Poly Colorant: Shadow Gray, 16 oz")
        case .tan:
            self.colorant = Product(id: "EX-KPLYCLTN-EA",
                                    name: "Poly Colorant: Tan, 16 oz")
        case .tileRed:
            self.colorant = Product(id: "EX-KPLYCLTR-EA",
                                    name: "Poly Colorant: Tile Red, 16 oz")
        case .white:
            self.colorant = Product(id: "EX-KPLYCLWH-EA",
                                    name: "Poly Colorant: White, 16 oz")
        }
        
        switch self.texture {
        case .noTexture:
            textureProduct = Product()
        case .asAo120:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#",
                                     type: .additive)
        case .asAo220:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#",
                                     type: .additive)
        case .asAo60:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#",
                                     type: .additive)
        case .asAo80:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#",
                                     type: .additive)
        case .asB100:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 32 oz",
                                     type: .additive)
        case .asB50:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 32 oz",
                                     type: .additive)
        case .asT50:
            break
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
            productsNeeded.append(Product(id: "Solvent Cleaner",
                                          name: "Solvent Cleaner",
                                          type: .additive))
        }
        
        if (self.mattingAdditive) {
            productsNeeded.append(Product(id: "Matting Additive",
                                          name: "Matting Additive",
                                          type: .additive))
        }

    }
    
}
