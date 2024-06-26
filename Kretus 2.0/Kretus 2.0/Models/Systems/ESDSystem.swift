//
//  ESDSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

class ESDSystem: System {
    
    @Published var subType: SubType
    
    @Published var mvrCoat: TSCoat
    @Published var topCoat: PACoat
    @Published var conductivePrimer: ConductivePrimer?
    @Published var cpWasteFactor: Int
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int,
         subType: SubType,
         mvrCoat: TSCoat,
         topCoat: PACoat,
         conductivePrimer: ConductivePrimer,
         cpWasteFactor: Int) {
        
        self.subType = subType
        self.mvrCoat = mvrCoat
        self.topCoat = topCoat
        self.conductivePrimer = conductivePrimer
        self.cpWasteFactor = cpWasteFactor
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.subType = .conductive
        self.mvrCoat = TSCoat()
        self.topCoat = PACoat()
        self.conductivePrimer = ConductivePrimer()
        self.cpWasteFactor = 0
        
        super.init(name: "ESD System",
                   description: "Description",
                   imageName: "esd-background",
                   viewColor: "ESD",
                   squareFt: 50,
                   kitsNeeded: [Kit()],
                   totalWasteFactor: 0)
    }

    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case conductive, dissipative
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .conductive: return "Conductive TS"
            case .dissipative: return "Dissipative TS"
            }
        }
    }
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        mvrCoat.setValues()
        updateKits(with: mvrCoat.kitsNeeded)
        totalWasteFactor += mvrCoat.wasteFactor
        
        topCoat.setValues()
        updateKits(with: topCoat.kitsNeeded)
        totalWasteFactor += topCoat.wasteFactor
        
        if (conductivePrimer != nil) {
            conductivePrimer!.setValues()
            updateKits(with: conductivePrimer!.kitsNeeded)
            totalWasteFactor += conductivePrimer!.wasteFactor
        }

    }
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType, thickness: TSCoat.Thickness) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.thickness = thickness
        
        
        return tsCoat
    }
    
    func createPACoat(squareFt: Int, coatType: PACoat.CoatType, thickness: PACoat.Thickness) -> PACoat {
        let paCoat = PACoat()
        paCoat.squareFt = squareFt
        paCoat.coatType = coatType
        paCoat.thickness = thickness
        
        return paCoat
    }
    
    func createCP(squareFt: Int) -> ConductivePrimer {
        let conductivePrimer = ConductivePrimer()
        conductivePrimer.squareFt = squareFt
        
        return conductivePrimer
    }
    
}
