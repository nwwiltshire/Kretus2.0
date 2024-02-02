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
    
    init(id: Int,
         name: String,
         description: String,
         imageName: String,
         viewColor: String)
         {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = imageName
        self.viewColor = viewColor
    }
    
    static func getAllSystems() -> [System] {
        
        return [UPCSystem(id: 0,
                       name: "UPC 1-Coat",
                       description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
                       imageName: "default",
                       viewColor: "UPC",
                       subType: .rc,
                       baseCoat: UPCCoat(),
                       primeCoat: UPCCoat(),
                       topCoat: UPCCoat(),
                       squareFt: 0,
                       totalkitsNeeded: [])]
        
    }
}
