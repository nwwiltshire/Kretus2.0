//
//  PDFData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/12/24.
//

import Foundation

struct PDFData {
    
    let url: String
    let type: TypeTopic
    let system: SystemTopic
    let coat: CoatTopic
    
    enum TypeTopic: CaseIterable, Codable, Identifiable, CustomStringConvertible, Comparable {
        case na, general, installationGuide, sds, tds
        
        var id: Self { self }
        
        var description: String {
            
            switch self {
                
            case .na: return "None"
            case .general: return "General Documentation"
            case .installationGuide: return "Installation Guide"
            case .sds: return "Safety Data Sheet"
            case .tds: return "Technical Data Sheet"
                
            }
        }
    }
    
    enum SystemTopic: CaseIterable, Codable, Identifiable, CustomStringConvertible, Comparable {
        case na, upc, colorChip, colorSplash, mvr, epoxyCove, upcCove, epoxyColorQuartz, upcColorQuartz, epoxySand, upcSand, metallic, esd
        
        var id: Self { self }
        
        var description: String {
            
            switch self {
                
            case .na: return "None"
            case .upc: return "UPC 1-Coat"
            case .colorChip: return "Color Chip"
            case .colorSplash: return "Color Splash"
            case .mvr: return "Epoxy MVR"
            case .epoxyCove: return "Epoxy Cove"
            case .upcCove: return "UPC Cove"
            case .epoxyColorQuartz: return "Epoxy Color Quartz"
            case .upcColorQuartz: return "UPC Color Quartz"
            case .epoxySand: return "Epoxy Industrial Sand"
            case .upcSand: return "UPC Industrial Sand"
            case .metallic: return "Metallic"
            case .esd: return "ESD"
            }
        }
    }
        
    enum CoatTopic: CaseIterable, Codable, Identifiable, CustomStringConvertible, Comparable {
        case na, ts, pa, pu, upc, conductivePrimer
        
        var id: Self { self }
        
        var description: String {
            
            switch self {
                
            case .na: return "None"
            case .ts: return "Top Shelf Epoxy"
            case .pa: return "Polyaspartic"
            case .pu: return "Polyurethane"
            case .upc: return "Urethane Polymer Concrete"
            case .conductivePrimer: return "Conductive Primer"
                
            }
        }
    }
    
}
