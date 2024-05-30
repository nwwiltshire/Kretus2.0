//
//  EpoxyCoveSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

class EpoxyCoveSystem: System {
    
    @Published var subType: SubType
    @Published var primeCoat: TSCoat
    @Published var bodyCoat: TSCoat
    @Published var capCoat: TSCoat
    @Published var broadcast: ColorChipBroadcast?
    @Published var height: Height
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int,
         subType: SubType,
         primeCoat: TSCoat,
         bodyCoat: TSCoat,
         capCoat: TSCoat,
         broadcast: ColorChipBroadcast?,
         height: Height) {
        
        self.subType = subType
        self.primeCoat = primeCoat
        self.bodyCoat = bodyCoat
        self.capCoat = capCoat
        self.broadcast = broadcast
        self.height = height
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.subType = .ecColor
        self.primeCoat = TSCoat()
        self.bodyCoat = TSCoat()
        self.capCoat = TSCoat()
        self.height = .fourIn
        
        super.init(name: "Epoxy Cove",
                   description: "Wall-to-floor seamless coating for industrial, commercial, and residential spaces.",
                   imageName: "epoxyCove-background",
                   viewColor: "EpoxyCove",
                   squareFt: 50,
                   kitsNeeded: [Kit()],
                   totalWasteFactor: 0)
    }
    
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case ecColor, ecColorChip, ecColorQuartz
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ecColor: return "Epoxy Cove Color"
            case .ecColorChip: return "Epoxy Cove Color Chip"
            case .ecColorQuartz: return "Epoxy Cove Color Quartz"
            }
        }
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
        
        if (broadcast != nil) {
            output += "\nBroadcast:\n\n\(broadcast!.printBroadcastTest())\n"
        }
        
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
        
        if (broadcast != nil) {
            broadcast!.setValues()
            updateKits(with: broadcast!.kitsNeeded)
            totalWasteFactor += broadcast!.wasteFactor
        }

    }
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType, selectedPartA: TSCoat.PartAs, coveHeight: Height) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.selectedPartA = selectedPartA
        tsCoat.coveHeight = coveHeight
        
        return tsCoat
    }
    
}
