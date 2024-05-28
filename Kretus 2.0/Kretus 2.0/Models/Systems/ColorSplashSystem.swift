//
//  ColorSplashSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/28/24.
//

import Foundation
import SwiftUI

class ColorSplashSystem: System {
    
    @Published var subTypes: [SubType]
    @Published var selectedSubType1: SubTypeBase
    @Published var selectedSubType2: SubType
    @Published var selectedSubType3: SubType
    @Published var coat1: Coat?
    @Published var coat2: Coat?
    @Published var coat3: Coat?
    @Published var solventCleaner: Bool
    @Published var mattingAdditive2: Bool
    @Published var mattingAdditive3: Bool
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int,
         subTypes: [SubType],
         selectedSubType1: SubTypeBase,
         selectedSubType2: SubType,
         selectedSubType3: SubType,
         coat1: Coat,
         coat2: Coat,
         coat3: Coat,
         solventCleaner: Bool,
         mattingAdditive2: Bool,
         mattingAdditive3: Bool) {
        
        self.subTypes = subTypes
        self.selectedSubType1 = selectedSubType1
        self.selectedSubType2 = selectedSubType2
        self.selectedSubType3 = selectedSubType3
        self.coat1 = coat1
        self.coat2 = coat2
        self.coat3 = coat3
        self.solventCleaner = solventCleaner
        self.mattingAdditive2 = mattingAdditive2
        self.mattingAdditive3 = mattingAdditive3
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.subTypes = [.ts]
        self.selectedSubType1 = .ts
        self.selectedSubType2 = .ts
        self.selectedSubType3 = .ts
        self.coat1 = TSCoat()
        self.coat2 = TSCoat()
        self.coat3 = TSCoat()
        self.solventCleaner = false
        self.mattingAdditive2 = false
        self.mattingAdditive3 = false

        
        super.init(
        name: "Color Splash Floor Sealer",
        description: "Enhance a structure’s natural color and features in clear gloss or cover walls and floors in warm or cool tones.",
        imageName: "colorSplash-background",
        viewColor: "ColorSplash",
        squareFt: 50,
        kitsNeeded: [Kit()],
        totalWasteFactor: 0
        )
    }
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case ts, pa, pu
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ts: return "Top Shelf Epoxy"
            case .pa: return "Polyaspartic"
            case .pu: return "Polyurethane"
            }
        }
    }
    
    enum SubTypeBase: CaseIterable, Identifiable, CustomStringConvertible {
        case ts, pa, pu, upc
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ts: return "Top Shelf Epoxy"
            case .pa: return "Polyaspartic"
            case .pu: return "Polyurethane"
            case .upc: return "Urethane Polymer Concrete"
            }
        }
    }
    
    /*
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
    */
    
    func createUPCCoat(squareFt: Int, coatType: UPCSystem.CoatType, subType: UPCSystem.SubType, solventCleaner: Bool) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        
        // handle solvent cleaner
        
        return upcCoat
      }
    
    func createTSCoat(squareFt: Int, solventCleaner: Bool, mattingAdditive: Bool) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        
        // handle solvent cleaner
        
        // handle matting additive
        
        return tsCoat
    }
    
    func createPACoat(squareFt: Int, solventCleaner: Bool, mattingAdditive: Bool) -> PACoat {
        let paCoat = PACoat()
        paCoat.squareFt = squareFt
        
        // handle solvent cleaner
        
        // handle matting additive
        
        return paCoat
    }
    
    func createPUCoat(squareFt: Int, solventCleaner: Bool, mattingAdditive: Bool) -> PUCoat {
        let puCoat = PUCoat()
        puCoat.squareFt = squareFt
        
        // handle solvent cleaner
        
        // handle matting additive
        
        return puCoat
    }
}
