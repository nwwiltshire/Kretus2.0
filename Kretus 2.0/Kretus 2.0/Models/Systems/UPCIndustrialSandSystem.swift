//
//  UPCIndustrialSandSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

class UPCIndustrialSandSystem: System {
    
    @Published var subType: SubType
    {
       didSet {
           updateThickness()
       }
   }
    
    @Published var thickness: Thickness // How does this effect covRate or coats?
    
    @Published var baseCoat: UPCCoat?
    @Published var baseCoat1: UPCCoat?
    @Published var baseCoat2: UPCCoat?
    @Published var broadcast: IndustrialSandBroadcast?
    @Published var broadcast1: IndustrialSandBroadcast?
    @Published var broadcast2: IndustrialSandBroadcast?
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
         thickness: Thickness,
         baseCoat: UPCCoat,
         baseCoat1: UPCCoat,
         baseCoat2: UPCCoat,
         broadcast: IndustrialSandBroadcast,
         broadcast1: IndustrialSandBroadcast,
         broadcast2: IndustrialSandBroadcast,
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
        self.baseCoat1 = baseCoat
        self.baseCoat2 = baseCoat
        self.broadcast = broadcast
        self.broadcast1 = broadcast
        self.broadcast2 = broadcast
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
        self.thickness = .oneEighth
        self.baseCoat = UPCCoat()
        self.broadcast = IndustrialSandBroadcast()
        self.capCoat = UPCCoat()
        self.topCoat = UPCCoat()
        self.capCoatSubType = .ts
        self.topCoatSubType = .ts
        self.capMattingAdditive = false
        self.topMattingAdditive = false
        
        super.init(name: "Industrial Sand UPC",
                   description: "Description",
                   imageName: "colorQuartz-background",
                   viewColor: "ColorQuartzEpoxy",
                   squareFt: 50,
                   kitsNeeded: [Kit()],
                   totalWasteFactor: 0)
    }
    
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case rc, tt, sl, mf, dbrc
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .rc: return "RC (Roll Coat)"
            case .tt: return "TT (Trowel Applied)"
            case .sl: return "SL (Self Leveling)"
            case .mf: return "MF (Medium Fill)"
            case .dbrc: return "DB RC (Double Broadcast)"
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case oneSixteenth, oneEighth, threeSixteenth, oneFourth, threeEighth
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .oneSixteenth: return "1/16\""
            case .oneEighth: return "1/8\""
            case .threeSixteenth: return "3/16\""
            case .oneFourth: return "1/4\""
            case .threeEighth: return "3/8\""
            }
        }
    }
    
    enum CapAndTopCoatSubType: CaseIterable, Identifiable, CustomStringConvertible {
        case ts, polyaspartic, polyurethane, upc, upcRCUV
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ts: return "Top Shelf Epoxy"
            case .polyaspartic: return "Polyaspartic"
            case .polyurethane: return "Polyurethane"
            case .upc: return "UPC"
            case .upcRCUV: return "UPC RC UV"
            }
        }
    }
    
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        if (baseCoat != nil) {
            baseCoat!.setValues()
            updateKits(with: baseCoat!.kitsNeeded)
            totalWasteFactor += baseCoat!.wasteFactor
        }
        
        if (baseCoat1 != nil) {
            baseCoat!.setValues()
            updateKits(with: baseCoat!.kitsNeeded)
            totalWasteFactor += baseCoat!.wasteFactor
        }
        
        if (baseCoat2 != nil) {
            baseCoat2!.setValues()
            updateKits(with: baseCoat2!.kitsNeeded)
            totalWasteFactor += baseCoat2!.wasteFactor
        }
        
        if (broadcast != nil) {
            broadcast!.setValues()
            updateKits(with: broadcast!.kitsNeeded)
            totalWasteFactor += broadcast!.wasteFactor
        }
        
        if (broadcast1 != nil) {
            broadcast1!.setValues()
            updateKits(with: broadcast1!.kitsNeeded)
            totalWasteFactor += broadcast1!.wasteFactor
        }
        
        if (broadcast2 != nil) {
            broadcast2!.setValues()
            updateKits(with: broadcast2!.kitsNeeded)
            totalWasteFactor += broadcast2!.wasteFactor
        }
        
        capCoat.setValues()
        updateKits(with: capCoat.kitsNeeded)
        totalWasteFactor += capCoat.wasteFactor
        
        topCoat.setValues()
        updateKits(with: topCoat.kitsNeeded)
        totalWasteFactor += topCoat.wasteFactor

        
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
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType, mattingAdditive: Bool) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.mattingAdditive = mattingAdditive
        
        return tsCoat
    }
    
    func createUPCCoat(squareFt: Int, subType: SubType, coatType: UPCSystem.CoatType, mattingAdditive: Bool, isUV: Bool) -> UPCCoat {
        let upcCoat = UPCCoat()
        upcCoat.squareFt = squareFt
        upcCoat.coatType = coatType
        upcCoat.mattingAdditive = mattingAdditive
        
        switch subType {
        case .rc:
            upcCoat.subType = .rc
        case .tt:
            upcCoat.subType = .tt
        case .sl:
            upcCoat.subType = .sl
        case .mf:
            upcCoat.subType = .mf
        case .dbrc:
            upcCoat.subType = .rc
        }
        
        if (isUV) {
            upcCoat.subType = .rcuv
        }
        
        return upcCoat
    }
    
    func createPACoat(squareFt: Int, coatType: PACoat.CoatType, mattingAdditive: Bool) -> PACoat {
        let paCoat = PACoat()
        paCoat.squareFt = squareFt
        paCoat.coatType = coatType
        paCoat.mattingAdditive = mattingAdditive
        
        return paCoat
    }
    
    func createPUCoat(squareFt: Int, coatType: PUCoat.CoatType, mattingAdditive: Bool) -> PUCoat {
        let puCoat = PUCoat()
        puCoat.squareFt = squareFt
        puCoat.coatType = coatType
        puCoat.mattingAdditive = mattingAdditive
        
        return puCoat
    }
    
    func updateThickness() {
        switch subType {
        case .rc:
            thickness = .oneSixteenth
        case .tt:
            thickness = .oneFourth
        case .sl:
            thickness = .threeSixteenth
        case .mf:
            thickness = .threeSixteenth
        case .dbrc:
            thickness = .threeSixteenth
        }
    }
    
}
