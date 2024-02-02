//
//  UPCSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//
import Combine
import Foundation

class UPCSystem: System {
    
    @Published var subType: SubType
    @Published var baseCoat: Coat
    @Published var primeCoat: Coat
    @Published var topCoat: Coat
    
    @Published var squareFt: Int = 0
    
    @Published var totalkitsNeeded: [Kit]
    
    
    init(id: Int,
         name: String,
         description: String,
         imageName: String,
         viewColor: String,
         subType: SubType,
         baseCoat: Coat,
         primeCoat: Coat,
         topCoat: Coat,
         squareFt: Int = 0,
         totalkitsNeeded: [Kit]) {
        
        self.subType = subType
        self.baseCoat = baseCoat
        self.primeCoat = primeCoat
        self.topCoat = topCoat
        self.squareFt = squareFt
        self.totalkitsNeeded = totalkitsNeeded
        
        super.init(id: id, name: name, description: description, imageName: imageName, viewColor: viewColor)

    }
}

// Add enums
extension UPCSystem {
    
    enum SubType: CaseIterable, Identifiable, CustomStringConvertible {
        case rc, tt, sl, mf
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .rc: return "RC"
            case .tt: return "TT"
            case .sl: return "SL"
            case .mf: return "MF"
            }
        }
    }
    
    enum SystemColor: CaseIterable, Identifiable, CustomStringConvertible {
        case none, black, blue, bone, brown, clay, gray, green, mustard, red
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .none: return "None"
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
            case .ez: return "EZ"
            case .ap: return "AP"
            case .fc: return "FC"
            }
        }
    }
}


