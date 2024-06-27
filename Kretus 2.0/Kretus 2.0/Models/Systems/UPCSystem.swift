//
//  UPCSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/15/24.
//

import Foundation
import SwiftUI


class UPCSystem: System {
    
    @Published var subType: SubType
    @Published var systemColor: SystemColor
    @Published var baseCoat: UPCCoat
    @Published var primeCoat: UPCCoat?
    @Published var topCoat: UPCCoat?
    @Published var uvResistance: Bool
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         subType: SubType,
         systemColor: SystemColor,
         baseCoat: UPCCoat,
         primeCoat: UPCCoat,
         topCoat: UPCCoat,
         uvResistance: Bool,
         totalWasteFactor: Int) {
        
        self.subType = subType
        self.systemColor = systemColor
        self.baseCoat = baseCoat
        self.primeCoat = primeCoat
        self.topCoat = topCoat
        self.uvResistance = uvResistance
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        self.subType = .rc
        self.systemColor = .unpigmented
        self.baseCoat = UPCCoat()
        self.uvResistance = false
        
        super.init(
        name: "UPC 1-Coat",
        description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
        imageName: "upc1coat-background",
        viewColor: "UPC",
        squareFt: 50,
        kitsNeeded: [Kit()],
        totalWasteFactor: 0
        )
    }
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case rc, tt, sl, mf, wcvc, rcuv
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .rc: return "RC (Roll Coat)"
            case .tt: return "TT (Trowel Applied)"
            case .sl: return "SL (Self Leveling)"
            case .mf: return "MF (Medium Fill SL)"
            case .wcvc: return "WC/VC"
            case .rcuv: return "RC UV"
            }
        }
    }
    
    // Hardeners ^^^
    
    enum SystemColor: CaseIterable, Identifiable, CustomStringConvertible {
        case unpigmented, black, blue, bone, brown, clay, gray, green, mustard, red
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .unpigmented: return "Unpigmented (UPC)"
            case .black: return "Black (UPC)"
            case .blue: return "Blue (UPC)"
            case .bone: return "Bone (UPC)"
            case .brown: return "Brown (UPC)"
            case .clay: return "Clay (UPC)"
            case .gray: return "Gray (UPC)"
            case .green: return "Green (UPC)"
            case .mustard: return "Mustard (UPC)"
            case .red: return "Red (UPC)"
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
        output += "Sub Type: \(subType)\n"
        output += "System Color: \(systemColor)\n"
        baseCoat.setValues()
        output += "\nBase Coat:\n\n\(baseCoat.printCoatTest())\n"
        
        if let primeCoat = primeCoat {
            primeCoat.setValues()
            output += "\nPrime Coat:\n\n\(primeCoat.printCoatTest())\n"
        } else {
            output += "\nPrime Coat: None\n"
        }
        
        if let topCoat = topCoat {
            topCoat.setValues()
            output += "\nTop Coat:\n\n\(topCoat.printCoatTest())\n"
        } else {
            output += "\nTop Coat: None\n"
        }
        
        output += "UV Resistance: \(uvResistance ? "Yes" : "No")\n"
        return output
    }

    func createUPCCoat(squareFt: Int, coatType: UPCCoat.CoatType, subType: SubType, coatColor: SystemColor, thickness: UPCCoat.Thickness) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        upcCoat.coatType = coatType
        upcCoat.subType = subType
        upcCoat.coatColor = coatColor
        upcCoat.thickness = thickness
        
        if (subType != .rc) {
            upcCoat.thickness = .thin
        }
        
        if (coatType == .top && uvResistance == true) {
            upcCoat.uvResistance = true
        }
        
        return upcCoat
      }
    
    override func getAllKits() {
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        baseCoat.setValues()
        updateKits(with: baseCoat.kitsNeeded)
        totalWasteFactor += baseCoat.wasteFactor

        if let primeCoat = primeCoat {
            primeCoat.setValues()
            updateKits(with: primeCoat.kitsNeeded)
            totalWasteFactor += primeCoat.wasteFactor
        }

        if let topCoat = topCoat {
            topCoat.setValues()
            updateKits(with: topCoat.kitsNeeded)
            totalWasteFactor += topCoat.wasteFactor
        }
    }


    
}
