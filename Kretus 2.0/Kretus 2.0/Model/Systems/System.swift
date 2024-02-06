//
//  UPC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//
import Combine
import Foundation

class System: ObservableObject {
    
    
    let id: Int
    let name: String
    let description: String
    let imageName: String
    let viewColor: String
    
    let availableSubTypes: [SubType]
    
    @Published var subType: SubType
    @Published var baseCoat: Coat
    @Published var primeCoat: Coat
    @Published var topCoat: Coat
    @Published var squareFt: Int
    @Published var totalkitsNeeded: [Kit]
    
    init(id: Int,
         name: String,
         description: String,
         imageName: String,
         viewColor: String,
         availableSubTypes: [SubType],
         subType: SubType,
         baseCoat: Coat,
         primeCoat: Coat,
         topCoat: Coat,
         squareFt: Int,
         totalkitsNeeded: [Kit])
         {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = imageName
        self.viewColor = viewColor
        self.availableSubTypes = availableSubTypes
        self.subType = subType
        self.baseCoat = baseCoat
        self.primeCoat = primeCoat
        self.topCoat = topCoat
        self.squareFt = squareFt
        self.totalkitsNeeded = totalkitsNeeded
    }
    
    enum SubType {
        case none, rc, tt, sl, mf
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "N/A"
            case .rc: return "RC (Roll Coat)"
            case .tt: return "TT (Trowel Applied)"
            case .sl: return "SL (Self Leveling)"
            case .mf: return "MF (Medium Fill SL)"
            }
        }
    }
    
    enum SystemColor: CaseIterable, Identifiable, CustomStringConvertible {
        case none, black, blue, bone, brown, clay, gray, green, mustard, red
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "N/A"
            case .black: return "Black"
            case .blue: return "Blue"
            case .bone: return "Bone"
            case .brown: return "Brown"
            case .clay: return "Clay"
            case .gray: return "Gray"
            case .green: return "Green"
            case .mustard: return "Mustard"
            case .red: return "Red"
            }
        }
    }
    
    enum Thickness: CaseIterable, Identifiable, CustomStringConvertible {
        case none, thin, medium, thick
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "N/A"
            case .thin: return "Thin"
            case .medium: return "Medium"
            case .thick: return "Thick"
            }
        }
    }
    
    enum Speed: CaseIterable, Identifiable, CustomStringConvertible {
        case none, ez, ap, fc
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "N/A"
            case .ez: return "EZ"
            case .ap: return "AP"
            case .fc: return "FC"
            }
        }
    }
    
    static func getAllSystems() -> [System] {
            
        return [UPCSystem(id: 0,
                        name: "UPC 1-Coat",
                        description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
                        imageName: "default",
                        viewColor: "UPC",
                        availableSubTypes: [.rc, .tt, .sl, .mf],
                        subType: .none,
                        baseCoat: UPCCoat(),
                        primeCoat: UPCCoat(),
                        topCoat: UPCCoat(),
                        squareFt: 0,
                        totalkitsNeeded: [])]
    }
}

class UPCSystem: System {}
