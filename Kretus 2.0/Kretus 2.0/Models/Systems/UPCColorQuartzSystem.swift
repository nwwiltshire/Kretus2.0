//
//  UPCColorQuartzSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

class UPCColorQuartzSystem: System {
    
    @Published var subType: SubType
    {
       didSet {
           updateThickness()
       }
   }
    
    @Published var thickness: UPCSystem.Thickness
    
    @Published var baseCoat: UPCCoat
    @Published var broadcast: ColorChipBroadcast
    @Published var capCoat: Coat
    @Published var topCoat: Coat
    @Published var primeCoat: UPCCoat?
    @Published var mvrCoat: UPCCoat?
    
    @Published var capCoatSubType: CapAndTopCoatSubType
    @Published var topCoatSubType: CapAndTopCoatSubType
    
    @Published var capMattingAdditive: Bool
    @Published var topMattingAdditive: Bool
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int,
         subType: SubType,
         thickness: UPCSystem.Thickness,
         baseCoat: UPCCoat,
         broadcast: ColorChipBroadcast,
         capCoat: Coat,
         topCoat: Coat,
         primeCoat: UPCCoat,
         mvrCoat: UPCCoat,
         capCoatSubType: CapAndTopCoatSubType,
         topCoatSubType: CapAndTopCoatSubType,
         capMattingAdditive: Bool,
         topMattingAdditive: Bool) {
        
        self.subType = subType
        self.thickness = thickness
        self.baseCoat = baseCoat
        self.broadcast = broadcast
        self.capCoat = capCoat
        self.topCoat = topCoat
        self.primeCoat = primeCoat
        self.mvrCoat = mvrCoat
        self.capCoatSubType = capCoatSubType
        self.topCoatSubType = topCoatSubType
        self.capMattingAdditive = capMattingAdditive
        self.topMattingAdditive = topMattingAdditive
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.subType = .rc
        self.thickness = .thinRC
        self.baseCoat = UPCCoat()
        self.broadcast = ColorChipBroadcast()
        self.capCoat = TSCoat()
        self.topCoat = TSCoat()
        self.capCoatSubType = .ts
        self.topCoatSubType = .ts
        self.capMattingAdditive = false
        self.topMattingAdditive = false
        
        super.init(name: "Color Quartz UPC",
                   description: "Beautiful, exceptionally durable, slip-resistant, hygienic, and easy-to-clean flooring solution. (Urethane Polymer Concrete System)",
                   imageName: "colorQuartz-background",
                   viewColor: "ColorQuartzUPC",
                   squareFt: 50,
                   kitsNeeded: [Kit()],
                   totalWasteFactor: 0)
    }
    
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case rc, tt, sl, mf
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .rc: return "Color Quartz RC (Roll Coat)"
            case .tt: return "Color Chip TT (Trowel Applied)"
            case .sl: return "Color Chip SL (Self Leveling)"
            case .mf: return "Color Chip MF (Medium Fill SL)"
            }
        }
    }
    
    enum CapAndTopCoatSubType: CaseIterable, Identifiable, CustomStringConvertible {
        case ts, polyaspartic, polyurethane
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ts: return "Top Shelf Epoxy"
            case .polyaspartic: return "Polyaspartic"
            case .polyurethane: return "Polyurethane"
            }
        }
    }
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        baseCoat.setValues()
        updateKits(with: baseCoat.kitsNeeded)
        totalWasteFactor += baseCoat.wasteFactor
        
        capCoat.setValues()
        updateKits(with: capCoat.kitsNeeded)
        totalWasteFactor += capCoat.wasteFactor
        
        topCoat.setValues()
        updateKits(with: topCoat.kitsNeeded)
        totalWasteFactor += topCoat.wasteFactor
        
        broadcast.setValues()
        updateKits(with: broadcast.kitsNeeded)
        totalWasteFactor += broadcast.wasteFactor
        
        if (primeCoat != nil) {
            primeCoat!.setValues()
            updateKits(with: primeCoat!.kitsNeeded)
            totalWasteFactor += primeCoat!.wasteFactor
        }
        
        if (mvrCoat != nil) {
            mvrCoat!.setValues()
            updateKits(with: mvrCoat!.kitsNeeded)
            totalWasteFactor += mvrCoat!.wasteFactor
        }

    }
    
    func createUPCCoat(squareFt: Int, coatType: UPCSystem.CoatType, subType: UPCColorQuartzSystem.SubType, thickness: UPCSystem.Thickness) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        upcCoat.coatType = coatType
        upcCoat.thickness = thickness
        
        // Converts color quartz subtype to upc subtype
        switch subType {
        case .rc:
            upcCoat.subType = .rc
        case .tt:
            upcCoat.subType = .tt
        case .sl:
            upcCoat.subType = .sl
        case .mf:
            upcCoat.subType = .mf
        }
        
        return upcCoat
      }
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType, mattingAdditive: Bool, thickness: TSCoat.Thickness) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.mattingAdditive = mattingAdditive
        tsCoat.thickness = thickness
        
        return tsCoat
    }
    
    func createPACoat(squareFt: Int, coatType: PACoat.CoatType, mattingAdditive: Bool, thickness: PACoat.Thickness) -> PACoat {
        let paCoat = PACoat()
        paCoat.squareFt = squareFt
        paCoat.coatType = coatType
        paCoat.mattingAdditive = mattingAdditive
        paCoat.thickness = thickness
        
        return paCoat
    }
    
    func createPUCoat(squareFt: Int, coatType: PUCoat.CoatType, mattingAdditive: Bool, thickness: PUCoat.Thickness) -> PUCoat {
        let puCoat = PUCoat()
        puCoat.squareFt = squareFt
        puCoat.coatType = coatType
        puCoat.mattingAdditive = mattingAdditive
        puCoat.thickness = thickness
        
        return puCoat
    }
    
    func updateThickness() {
        switch subType {
        case .rc:
            break
        case .tt:
            thickness = .quartzTT
        case .sl:
            thickness = .medium
        case .mf:
            thickness = .medium
        }
    }
    
}

