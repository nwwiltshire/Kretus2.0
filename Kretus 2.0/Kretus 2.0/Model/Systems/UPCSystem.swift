//
//  UPCSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/15/24.
//

import Foundation
import SwiftUI

class UPCSystem: System {
    
    let availableSubTypes: [SubType]
    let availableSystemColors: [SystemColor]
    
    @Published var subType: SubType
    @Published var systemColor: SystemColor
    @Published var baseCoat: Coat
    @Published var primeCoat: Coat?
    @Published var topCoat: Coat?
    @Published var uvResistance: Bool
    
    init(id: Int,
         name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         totalkitsNeeded: [Kit],
         availableSubTypes: [SubType],
         availableSystemColors: [SystemColor],
         subType: SubType,
         systemColor: SystemColor,
         baseCoat: Coat,
         primeCoat: Coat,
         topCoat: Coat,
         uvResistance: Bool) {
        
        self.availableSubTypes = availableSubTypes
        self.availableSystemColors = availableSystemColors
        self.subType = subType
        self.systemColor = systemColor
        self.baseCoat = baseCoat
        self.primeCoat = primeCoat
        self.topCoat = topCoat
        self.uvResistance = uvResistance
        
        super.init(id: id, name: name, description: description, imageName: imageName, viewColor: viewColor, squareFt: squareFt, totalkitsNeeded: totalkitsNeeded)
        
    }
    
    init() {
        
        self.availableSubTypes = [.rc, .tt, .sl, .mf]
        self.availableSystemColors = [.unpigmented, .black, .blue, .bone, .brown, .clay, .gray, .green, .mustard, .red]
        self.subType = .rc
        self.systemColor = .unpigmented
        self.baseCoat = UPCCoat()
        self.uvResistance = false
        
        super.init(
        id: 0,
        name: "UPC 1-Coat",
        description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
        imageName: "upc1coat-background",
        viewColor: "UPC",
        squareFt: 0,
        totalkitsNeeded: []
        )
    }
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case rc, tt, sl, mf
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .rc: return "RC (Roll Coat)"
            case .tt: return "TT (Trowel Applied)"
            case .sl: return "SL (Self Leveling)"
            case .mf: return "MF (Medium Fill SL)"
            }
        }
    }
    
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
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case thin, medium, thick
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .thin: return "Thin"
            case .medium: return "Medium"
            case .thick: return "Thick"
            }
        }
    }
    
    enum Speed: CaseIterable, Identifiable, CustomStringConvertible {
        case ez, ap, fc
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .ez: return "EZ (Easy)"
            case .ap: return "AP (Average Pace)"
            case .fc: return "FC (Fast Cure)"
            }
        }
    }
    
    enum Texture {
        case none, antiSlip60, antiSlip36, antiSlip24, industrialSand60, industrialSand30, industrialSand20
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "N/A"
            case .antiSlip60: return "Anti Slip 60"
            case .antiSlip36: return "Anti Slip 36"
            case .antiSlip24: return "Anti Slip 24"
            case .industrialSand60: return "Industrial Sand 60"
            case .industrialSand30: return "Industrial Sand 30"
            case .industrialSand20: return "Industrial Sand 20"
            }
        }
    }
    
}
