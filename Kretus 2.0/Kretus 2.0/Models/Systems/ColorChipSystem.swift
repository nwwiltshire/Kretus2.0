//
//  ColorChipSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/17/24.
//

import Foundation
import SwiftUI

class ColorChipSystem: System {
    
    let availableSubTypes: [SubType]
    
    @Published var subType: SubType
    @Published var baseCoat: Coat
    @Published var primeCoat: Coat?
    @Published var topCoat: Coat?
    @Published var mvrCoat: Coat?
    
    @Published var broadCast: ColorChipSystem.Broadcast
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         availableSubTypes: [SubType],
         subType: SubType,
         baseCoat: Coat,
         primeCoat: Coat,
         topCoat: Coat,
         mvrCoat: Coat,
         broadCast: ColorChipSystem.Broadcast,
         totalWasteFactor: Int) {
        
        self.availableSubTypes = availableSubTypes
        self.subType = subType
        self.baseCoat = baseCoat
        self.primeCoat = primeCoat
        self.topCoat = topCoat
        self.mvrCoat = mvrCoat
        self.broadCast = broadCast
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.availableSubTypes = [.rc, .rcuv, .sl, .pa, .ts]
        self.subType = .ts
        self.baseCoat = TSCoat() // update later
        self.broadCast = .quarter
        
        super.init(
        name: "Color Chip",
        description: "Stand up to continuous heavy traffic in high-use spaces, camouflage dust and debris, improve resistance, and add vibrant or soft color to any room.",
        imageName: "colorChip-background",
        viewColor: "ColorChip",
        squareFt: 50,
        kitsNeeded: [Kit()],
        totalWasteFactor: 0
        )
    }
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case ts, pa, rc, rcuv, sl
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ts: return "TS (Top Shelf Epoxy)"
            case .pa: return "PA (Polyaspartic)"
            case .rc: return "RC (Roll Coat)"
            case .rcuv: return "RC UV (Roll Coat w/ UV)"
            case .sl: return "SL (Self Leveling)"
            }
        }
    }
    
    enum Broadcast: CaseIterable, Identifiable, CustomStringConvertible {
        case quarter, eighth
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .quarter: return "1/4\""
            case .eighth: return "1/8\""
            }
        }
    }
    
    enum CoatType: CaseIterable, Identifiable, CustomStringConvertible {
        case base, prime, top, mvr
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            case .mvr: return "MVR Coat"
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
        output += "Available Sub Types: \(availableSubTypes)\n"
        output += "Sub Type: \(subType)\n"
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
        return output
    }

    func createColorChipCoat(squareFt: Int, coatType: UPCSystem.CoatType, subType: UPCSystem.SubType, coatColor: UPCSystem.SystemColor) -> Coat {
        
        let tsCoat = TSCoat()
        
        /*
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.subType = subType
        tsCoat.coatColor = coatColor
        */
        
        // finish later
        
        return tsCoat
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
        
        if let mvrCoat = mvrCoat {
            mvrCoat.setValues()
            updateKits(with: mvrCoat.kitsNeeded)
            totalWasteFactor += mvrCoat.wasteFactor
        }
    }
    
    func createUPCCoat(squareFt: Int, coatType: UPCSystem.CoatType, subType: UPCSystem.SubType, uvResistance: Bool) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        upcCoat.coatType = coatType
        upcCoat.subType = subType
        upcCoat.uvResistance = uvResistance
        
        return upcCoat
      }
    
}
