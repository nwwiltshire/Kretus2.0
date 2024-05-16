//
//  UPC.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//
import Combine
import Foundation

class System: ObservableObject, Identifiable {

    let name: String
    let description: String
    let imageName: String
    let viewColor: String
    
    @Published var squareFt: Int
    @Published var kitsNeeded: [Kit]
    @Published var totalWasteFactor: Int
    
    init(name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         kitsNeeded: [Kit],
         totalWasteFactor: Int)
         {
        self.name = name
        self.description = description
        self.imageName = imageName
        self.viewColor = viewColor
        self.squareFt = squareFt
        self.kitsNeeded = kitsNeeded
        self.totalWasteFactor = totalWasteFactor
    }
    
    static func getAllSystems() -> [System] {
            
        return [UPCSystem()]
        
    }
    
    static func getTestSystem() -> System {
        
        return UPCSystem()
        
    }
    
    func printSystemTest() -> String {
        
        var output = ""
        output += "System Name: \(name)\n"
        output += "Description: \(description)\n"
        output += "Image Name: \(imageName)\n"
        output += "View Color: \(viewColor)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Kits Needed: \(kitsNeeded)\n"
        return output
        
    }
    
    func getAllKits() {
        
        // Calculates kits for all coats and appends them to system array
        
    }
}
