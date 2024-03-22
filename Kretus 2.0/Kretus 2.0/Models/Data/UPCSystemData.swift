//
//  SystemData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/23/24.
//


import Foundation
import SwiftData

@Model
final class UPCSystemData {
    let name: String
    let imageName: String
    let viewColor: String

    var subType: SubType
    var systemColor: SystemColor
    var baseCoat: UPCCoatData
    var primeCoat: UPCCoatData?
    var topCoat: UPCCoatData?
    var uvResistance: Bool

    var squareFt: Int
    var kitsNeeded: [KitData]

    // Initializer with all parameters
    init(name: String, imageName: String, viewColor: String, subType: SubType, systemColor: SystemColor, baseCoat: UPCCoatData, primeCoat: UPCCoatData? = nil, topCoat: UPCCoatData? = nil, uvResistance: Bool, squareFt: Int, kitsNeeded: [KitData]) {
    self.name = name
    self.imageName = imageName
    self.viewColor = viewColor
    self.subType = subType
    self.systemColor = systemColor
    self.baseCoat = baseCoat
    self.primeCoat = primeCoat
    self.topCoat = topCoat
    self.uvResistance = uvResistance
    self.squareFt = squareFt
    self.kitsNeeded = kitsNeeded
    }


    enum SubType: CaseIterable, Codable, Identifiable, CustomStringConvertible {
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

    // Hardeners ^^^

    enum SystemColor: CaseIterable, Codable, Identifiable, CustomStringConvertible {
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

    enum Thickness: CaseIterable, Codable, Identifiable, CustomStringConvertible {
        case thinRC, mediumRC, thickRC, thin, medium, thick
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .thinRC: return "8-12 mils"
            case .mediumRC: return "15-20 mils"
            case .thickRC: return "25-30 mils"
            case .thin: return "1/8\""
            case .medium: return "3/16\""
            case .thick: return "1/4\""
            }
        }
    }

    enum Speed: CaseIterable, Codable, Identifiable, CustomStringConvertible {
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

    enum Texture: CaseIterable, Codable, Identifiable, CustomStringConvertible {
        case none, antiSlip60, antiSlip36, antiSlip24, industrialSand60, industrialSand30, industrialSand20
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "No Texture"
            case .antiSlip60: return "Anti Slip 60"
            case .antiSlip36: return "Anti Slip 36"
            case .antiSlip24: return "Anti Slip 24"
            case .industrialSand60: return "Industrial Sand 60"
            case .industrialSand30: return "Industrial Sand 30"
            case .industrialSand20: return "Industrial Sand 20"
            }
        }
    }

    enum CoatType: CaseIterable, Codable, Identifiable, CustomStringConvertible {
        case base, prime, top
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .base: return "Base Coat"
            case .prime: return "Prime Coat"
            case .top: return "Top Coat"
            }
        }
    }
}


