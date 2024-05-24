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
    @Published var topCoat1: PACoat
    @Published var topCoat2: Coat?
    @Published var topCoat2SubType: TopCoat2SubType
    @Published var mvrCoat: Coat?
    
    @Published var broadcast: ColorChipBroadcast
    
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
         topCoat1: PACoat,
         topCoat2: Coat,
         topCoat2SubType: TopCoat2SubType,
         mvrCoat: Coat,
         broadcast: ColorChipBroadcast,
         totalWasteFactor: Int) {
        
        self.availableSubTypes = availableSubTypes
        self.subType = subType
        self.baseCoat = baseCoat
        self.primeCoat = primeCoat
        self.topCoat1 = topCoat1
        self.topCoat2 = topCoat2
        self.topCoat2SubType = topCoat2SubType
        self.mvrCoat = mvrCoat
        self.broadcast = broadcast
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.availableSubTypes = [.rc, .rcuv, .sl, .pa, .ts]
        self.subType = .ts
        self.baseCoat = TSCoat() // updates later
        self.topCoat1 = PACoat()
        self.topCoat2SubType = .polyaspartic // Set by default even if there is no top coat 2
        self.broadcast = ColorChipBroadcast()
        
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
    
    enum TopCoat2SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case polyaspartic, polyurethane
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .polyaspartic: return "Polyaspartic"
            case .polyurethane: return "Polyurethane"
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
        baseCoat.setValues()
        output += "\nBase Coat:\n\n\(baseCoat.printCoatTest())\n"
        
        if let primeCoat = primeCoat {
            //primeCoat.setValues()
            output += "\nPrime Coat:\n\n\(primeCoat.printCoatTest())\n"
        } else {
            output += "\nPrime Coat: None\n"
        }
        
        if let mvrCoat = mvrCoat {
            //mvrCoat.setValues()
            output += "\nMVR Coat:\n\n\(mvrCoat.printCoatTest())\n"
        } else {
            output += "\nMVR Coat: None\n"
        }
        
        topCoat1.setValues()
        output += "\nTop Coat 1: \n\n\(topCoat1.printCoatTest())"
        
        if let topCoat2 = topCoat2 {
            //topCoat2.setValues()
            output += "\nTop Coat 2:\n\n\(topCoat2.printCoatTest())\n"
        } else {
            output += "\nTop Coat 2: None\n"
        }
        
        
        return output
    }
    
    override func getAllKits() {
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        baseCoat.setValues()
        updateKits(with: baseCoat.kitsNeeded)
        totalWasteFactor += baseCoat.wasteFactor
        
        topCoat1.setValues()
        updateKits(with: topCoat1.kitsNeeded)
        totalWasteFactor += topCoat1.wasteFactor
        
        broadcast.setValues()
        updateKits(with: broadcast.kitsNeeded)
        totalWasteFactor += broadcast.wasteFactor

        if let primeCoat = primeCoat {
            primeCoat.setValues()
            updateKits(with: primeCoat.kitsNeeded)
            totalWasteFactor += primeCoat.wasteFactor
        }

        if let topCoat2 = topCoat2 {
            topCoat2.setValues()
            updateKits(with: topCoat2.kitsNeeded)
            totalWasteFactor += topCoat2.wasteFactor
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
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        
        return tsCoat
    }
    
    func createPACoat(squareFt: Int, coatType: PACoat.CoatType) -> PACoat {
        let paCoat = PACoat()
        paCoat.squareFt = squareFt
        paCoat.coatType = coatType
        
        return paCoat
    }
    
    func createPUCoat(squareFt: Int, coatType: PUCoat.CoatType) -> PUCoat {
        let puCoat = PUCoat()
        puCoat.squareFt = squareFt
        puCoat.coatType = coatType
        
        return puCoat
    }
    
}
