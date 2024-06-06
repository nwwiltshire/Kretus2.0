//
//  PUProducts.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/6/24.
//

import Foundation

extension PUCoat {
    
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
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#")
        case .asAo220:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#")
        case .asAo60:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#")
        case .asAo80:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 10#")
        case .asB100:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 32 oz")
        case .asB50:
            textureProduct = Product(id: "Contact Distributor",
                                     name: "\(texture.description), 32 oz")
        case .asT50:
            break
        }
        
        productsNeeded.removeAll()
        
        productsNeeded.append(partA)
        productsNeeded.append(partB)
        
        if (self.texture != .noTexture) {
            productsNeeded.append(textureProduct)
        }
        
        if (self.solventCleaner) {
            productsNeeded.append(Product(id: "Solvent Cleaner",
                                          name: "Solvent Cleaner"))
        }
        
        if (self.mattingAdditive) {
            productsNeeded.append(Product(id: "Matting Additive",
                                          name: "Matting Additive"))
        }

    }
    
}
