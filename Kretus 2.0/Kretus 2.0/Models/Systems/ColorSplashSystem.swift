//
//  ColorSplashSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/28/24.
//

import Foundation
import SwiftUI

class ColorSplashSystem: System {
    
    @Published var subTypes: [SubType] // In case it could be useful for documentation
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
    
    override func printSystemTest() -> String {
        var output = ""
        output += "System Name: \(name)\n"
        output += "Description: \(description)\n"
        output += "Image Name: \(imageName)\n"
        output += "View Color: \(viewColor)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Total Kits Needed: \(kitsNeeded)\n"
        output += "\nCoat 1:\n\n\(coat1!.printCoatTest())\n"
        output += "\nCoat 2:\n\n\(coat2!.printCoatTest())\n"
        output += "\nCoat 3:\n\n\(coat3!.printCoatTest())\n"
        
        return output
    }
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        coat1!.setValues()
        updateKits(with: coat1!.kitsNeeded)
        totalWasteFactor += coat1!.wasteFactor
        
        coat2!.setValues()
        updateKits(with: coat2!.kitsNeeded)
        totalWasteFactor += coat2!.wasteFactor
        
        coat3!.setValues()
        updateKits(with: coat3!.kitsNeeded)
        totalWasteFactor += coat3!.wasteFactor

    }
    
    func createUPCCoat(squareFt: Int, coatType: Coat.CoatType, solventCleaner: Bool, thickness: UPCCoat.Thickness) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        upcCoat.coatType = coatType
        upcCoat.solventCleaner = solventCleaner
        upcCoat.thickness = thickness
        
        return upcCoat
      }
    
    func createTSCoat(squareFt: Int, coatType: Coat.CoatType, solventCleaner: Bool, mattingAdditive: Bool, thickness: TSCoat.Thickness) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.solventCleaner = solventCleaner
        tsCoat.mattingAdditive = mattingAdditive
        tsCoat.thickness = thickness
        
        return tsCoat
    }
    
    func createPACoat(squareFt: Int, coatType: Coat.CoatType, solventCleaner: Bool, mattingAdditive: Bool, thickness: PACoat.Thickness) -> PACoat {
        let paCoat = PACoat()
        paCoat.squareFt = squareFt
        paCoat.coatType = coatType
        paCoat.solventCleaner = solventCleaner
        paCoat.mattingAdditive = mattingAdditive
        paCoat.thickness = thickness
        
        return paCoat
    }
    
    func createPUCoat(squareFt: Int, coatType: Coat.CoatType, solventCleaner: Bool, mattingAdditive: Bool, thickness: PUCoat.Thickness) -> PUCoat {
        let puCoat = PUCoat()
        puCoat.squareFt = squareFt
        puCoat.coatType = coatType
        puCoat.solventCleaner = solventCleaner
        puCoat.mattingAdditive = mattingAdditive
        puCoat.thickness = thickness
        
        return puCoat
    }
}
