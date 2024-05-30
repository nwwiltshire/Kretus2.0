//
//  EpoxyMVRSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

class EpoxyMVRSystem: System {
    
    @Published var mvrCoat: TSCoat
    @Published var primeCoat: TSCoat?
    
    @Published var hasPrimeCoat: Bool
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int,
         mvrCoat: TSCoat,
         primeCoat: TSCoat,
         hasPrimeCoat: Bool) {
        
        self.mvrCoat = mvrCoat
        self.primeCoat = primeCoat
        self.hasPrimeCoat = hasPrimeCoat
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.mvrCoat = TSCoat()
        self.hasPrimeCoat = false

        
        super.init(
        name: "Epoxy MVR",
        description: "Protects systems installed over concrete slabs with 100% relative humidity by mitigating moisture's harmful effects.",
        imageName: "epoxyMVR-background",
        viewColor: "EpoxyMVR",
        squareFt: 50,
        kitsNeeded: [Kit()],
        totalWasteFactor: 0
        )
    }
    
    override func printSystemTest() -> String {
        var output = ""
        output += "System Name: \(name)\n"
        output += "Description: \(description)\n"
        output += "Image Name: \(imageName)\n"
        output += "View Color: \(viewColor)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Total Kits Needed: \(kitsNeeded)\n"
        output += "\nMVR Coat:\n\n\(mvrCoat.printCoatTest())\n"
        
        if (primeCoat != nil) {
            output += "\nPrime Coat:\n\n\(primeCoat!.printCoatTest())\n"
        }
        
        return output
    }
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        mvrCoat.setValues()
        updateKits(with: mvrCoat.kitsNeeded)
        totalWasteFactor += mvrCoat.wasteFactor
        
        if (primeCoat != nil) {
            primeCoat!.setValues()
            updateKits(with: primeCoat!.kitsNeeded)
            totalWasteFactor += primeCoat!.wasteFactor
        }

    }
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        
        return tsCoat
    }
}
