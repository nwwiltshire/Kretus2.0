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
    
    @Published var squareFt: Int
    @Published var totalkitsNeeded: [Kit]
    
    init(id: Int,
         name: String,
         description: String,
         imageName: String,
         viewColor: String,
         squareFt: Int,
         totalkitsNeeded: [Kit])
         {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = imageName
        self.viewColor = viewColor
        self.squareFt = squareFt
        self.totalkitsNeeded = totalkitsNeeded
    }
    
    static func getAllSystems() -> [System] {
            
        return [UPCSystem()]
        
    }
    
    static func getTestSystem() -> System {
        
        return UPCSystem()
        
    }
    
    func printSystemTest() -> String {
        
        var output = ""
        output += "System ID: \(id)\n"
        output += "System Name: \(name)\n"
        output += "Description: \(description)\n"
        output += "Image Name: \(imageName)\n"
        output += "View Color: \(viewColor)\n"
        output += "Square Feet: \(squareFt)\n"
        output += "Total Kits Needed: \(totalkitsNeeded)\n"
        return output
        
    }
}
