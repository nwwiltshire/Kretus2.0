//
//  UPCCoveSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

class UPCCoveSystem: System {
    
    @Published var primeCoat: UPCCoat
    @Published var bodyCoat: UPCCoat
    @Published var capCoat: UPCCoat
    @Published var height: Height
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int,
         primeCoat: UPCCoat,
         bodyCoat: UPCCoat,
         capCoat: UPCCoat,
         height: Height) {
        
        self.primeCoat = primeCoat
        self.bodyCoat = bodyCoat
        self.capCoat = capCoat
        self.height = height
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.primeCoat = UPCCoat()
        self.bodyCoat = UPCCoat()
        self.capCoat = UPCCoat()
        self.height = .fourIn
        
        super.init(name: "UPC Cove",
                   description: "Wall-to-floor seamless coating for industrial, commercial, and residential spaces. Works best between UPC Floor and Wall Coatings.",
                   imageName: "upcCove-background",
                   viewColor: "UPCCove",
                   squareFt: 50,
                   kitsNeeded: [Kit()],
                   totalWasteFactor: 0)
    }
    
    enum Height: CaseIterable, Identifiable, CustomStringConvertible {
        case na, fourIn, sixIn
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .na: return "None"
            case .fourIn: return "4\""
            case .sixIn: return "6\""
            }
        }
    }
    
    override func printSystemTest() -> String {
        var output = ""
        output += "System Name: \(name)\n"
        output += "Description: \(description)\n"
        output += "Image Name: \(imageName)\n"
        output += "View Color: \(viewColor)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Total Kits Needed: \(kitsNeeded)\n"
        output += "\nCoat 1:\n\n\(primeCoat.printCoatTest())\n"
        output += "\nCoat 2:\n\n\(bodyCoat.printCoatTest())\n"
        output += "\nCoat 3:\n\n\(capCoat.printCoatTest())\n"
        
        
        return output
    }
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        primeCoat.setValues()
        updateKits(with: primeCoat.kitsNeeded)
        totalWasteFactor += primeCoat.wasteFactor
        
        bodyCoat.setValues()
        updateKits(with: bodyCoat.kitsNeeded)
        totalWasteFactor += bodyCoat.wasteFactor
        
        capCoat.setValues()
        updateKits(with: capCoat.kitsNeeded)
        totalWasteFactor += capCoat.wasteFactor

    }
    
    func createUPCCoat(squareFt: Int, coatType: Coat.CoatType, subType: UPCSystem.SubType, coveHeight: Height) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        upcCoat.coatType = coatType
        upcCoat.subType = subType
        upcCoat.coveHeight = coveHeight
        
        return upcCoat
    }
    
}
