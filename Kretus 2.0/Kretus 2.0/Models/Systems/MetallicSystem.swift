//
//  MetallicSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

class MetallicSystem: System {
    
    @Published var subType: SubType {
        didSet {
            updateTopCoat()
        }
    }
    
    @Published var thickness: Thickness
    
    @Published var metallicBaseCoat: TSCoat?
    @Published var metallicAccentCoat: TSCoat?
    @Published var metallicBodyCoat: PUCoat?
    @Published var topCoat: Coat
    @Published var primeCoat: TSCoat
    
    @Published var topCoatSubType: TopCoatSubType
    
    @Published var primeSolventCleaner: Bool
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
         metallicBaseCoat: TSCoat,
         metallicAccentCoat: TSCoat,
         metallicBodyCoat: PUCoat,
         topCoat: Coat,
         primeCoat: TSCoat,
         topCoatSubType: TopCoatSubType,
         primeSolventCleaner: Bool,
         topMattingAdditive: Bool) {
        
        self.subType = subType
        self.thickness = thickness
        self.metallicBaseCoat = metallicBaseCoat
        self.metallicAccentCoat = metallicAccentCoat
        self.metallicBodyCoat = metallicBodyCoat
        self.topCoat = topCoat
        self.primeCoat = primeCoat
        self.topCoatSubType = topCoatSubType
        self.primeSolventCleaner = primeSolventCleaner
        self.topMattingAdditive = topMattingAdditive
        
        super.init(name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, kitsNeeded: kitsNeeded, totalWasteFactor: totalWasteFactor)
        
    }
    
    init() {
        
        self.subType = .metallic
        self.thickness = .thin
        self.metallicBaseCoat = TSCoat()
        self.metallicAccentCoat = TSCoat()
        self.topCoat = TSCoat()
        self.primeCoat = TSCoat()
        self.topCoatSubType = .ts
        self.primeSolventCleaner = false
        self.topMattingAdditive = false
        
        super.init(name: "Metallic",
                   description: "Luxurious 3-D systems that combine the strength of our Top Shelf® Epoxy, the longevity of Polyurethane HS (High Shine), and the brilliance of reflective glass for a floor that’s beautiful, built to last, and easy to clean.",
                   imageName: "metallic-Background",
                   viewColor: "Metallic",
                   squareFt: 50,
                   kitsNeeded: [Kit()],
                   totalWasteFactor: 0)
    }
    
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case metallic, uv
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .metallic: return "Metallic"
            case .uv: return "Metallic UV"
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case thin, medium, thick
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .thin: return "15-20 WFT"
            case .medium: return "25-30 WFT"
            case .thick: return "40-45 WFT"
            }
        }
    }
    
    enum TopCoatSubType: CaseIterable, Identifiable, CustomStringConvertible {
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
    
    
    override func getAllKits() {
        
        kitsNeeded.removeAll()
        totalWasteFactor = 0
        
        if (metallicBaseCoat != nil) {
            metallicBaseCoat!.setValues()
            updateKits(with: metallicBaseCoat!.kitsNeeded)
            totalWasteFactor += metallicBaseCoat!.wasteFactor
        }
        
        if (metallicBodyCoat != nil) {
            metallicBodyCoat!.setValues()
            updateKits(with: metallicBodyCoat!.kitsNeeded)
            totalWasteFactor += metallicBodyCoat!.wasteFactor
        }
        
        if (metallicAccentCoat != nil) {
            metallicAccentCoat!.setValues()
            updateKits(with: metallicAccentCoat!.kitsNeeded)
            totalWasteFactor += metallicAccentCoat!.wasteFactor
        }
        
        topCoat.setValues()
        updateKits(with: topCoat.kitsNeeded)
        totalWasteFactor += topCoat.wasteFactor
        
        primeCoat.setValues()
        updateKits(with: primeCoat.kitsNeeded)
        totalWasteFactor += primeCoat.wasteFactor

    }
    
    func createTSCoat(squareFt: Int, coatType: TSCoat.CoatType, mattingAdditive: Bool, solventCleaner: Bool) -> TSCoat {
        let tsCoat = TSCoat()
        tsCoat.squareFt = squareFt
        tsCoat.coatType = coatType
        tsCoat.mattingAdditive = mattingAdditive
        tsCoat.solventCleaner = solventCleaner
        
        if (coatType == .metallicBase || coatType == .metallicAccent) {
            tsCoat.coatColorant = .metallic
        }
        
        if (coatType == .metallicAccent || coatType == .prime) {
            tsCoat.selectedPartA = .arClear
        }
        
        return tsCoat
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
    
    func updateTopCoat() {
        switch subType {
        case .metallic:
            topCoatSubType = .ts
        case .uv:
            topCoatSubType = .pa
        }
    }
    
}
