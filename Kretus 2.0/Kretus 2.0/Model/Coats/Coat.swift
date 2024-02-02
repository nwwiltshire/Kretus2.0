//
//  upcRC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

enum CoatType {
    
    case base
    case prime
    case top
    
}

enum SubType {
    
    case rc
    case tt
    case sl
    case mf
    
}

enum CoatColor {
    
    case none
    case black
    case blue
    case bone
    case brown
    case clay
    case gray
    case green
    case mustard
    case red
    
}

enum Thickness {
    
    case thin
    case medium
    case thick
    
}

enum Speed {
    
    case ez
    case ap
    case fc
    
}

enum Texture {
    
    case none
    case antiSlip60
    case antiSlip36
    case antiSlip24
    case industrialSand60
    case industrialSand30
    case industrialSand20
    
}

class Coat {
    
    var coatType: CoatType
    var subType: SubType
    
    var coatColor: CoatColor
    var thickness: Thickness
    var speed: Speed
    var uvProtection: Bool
    var texture: Texture
    
    var partA: Product
    var partB: Product
    var partC: Product
    var colorant: Product
    
    var productsNeeded: [Product]
    var kitsNeeded: [Kit]
    
    init(coatType: CoatType, subType: SubType, coatColor: CoatColor, thickness: Thickness, speed: Speed, uvProtection: Bool, texture: Texture, partA: Product, partB: Product, partC: Product, colorant: Product, productsNeeded: [Product], kitsNeeded: [Kit]) {
        
        self.coatType = coatType
        self.subType = subType
        self.coatColor = coatColor
        self.thickness = thickness
        self.speed = speed
        self.uvProtection = uvProtection
        self.texture = texture
        self.partA = partA
        self.partB = partB
        self.partC = partC
        self.colorant = colorant
        self.productsNeeded = productsNeeded
        self.kitsNeeded = kitsNeeded
        
    }
    
    init() {
        
            self.coatType = .base
            self.subType = .rc
            self.coatColor = .none
            self.thickness = .thin
            self.speed = .ez
            self.uvProtection = false
            self.texture = .none
            self.partA = Product()
            self.partB = Product()
            self.partC = Product()
            self.colorant = Product()
            self.productsNeeded = []
            self.kitsNeeded = []
        
        }
    
    func findProductsABC() {
        
        // switch to find products
        
    }
    
    func findProductsColorant() {
        
        // switch to find products
        
    }
    
    func calcKits(squareFeet: Int) {
        
        // This will replace quant function
        
    }
}
