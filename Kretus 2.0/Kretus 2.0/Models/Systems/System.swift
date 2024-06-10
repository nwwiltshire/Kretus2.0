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
            
        return [UPCSystem(),
                ColorChipSystem(),
                ColorSplashSystem(),
                EpoxyMVRSystem(),
                EpoxyCoveSystem(),
                UPCCoveSystem(),
                UPCColorQuartzSystem(),
                EpoxyColorQuartzSystem(),
                EpoxyIndustrialSandSystem(),
                UPCIndustrialSandSystem()]
        
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
    
    func updateKits(with newKits: [Kit]) {
      for kit in newKits {
        // Check if a kit with the same product ID already exists
        let existingKitIndex = kitsNeeded.firstIndex(where: { $0.id == kit.id })
        if let existingIndex = existingKitIndex {
          // Update the quantity of the existing kit
          kitsNeeded[existingIndex].quantity += kit.quantity
        } else {
          // Add the new kit to kitsNeeded
          kitsNeeded.append(kit)
        }
      }
    }
    
    func getAllKits() {
        
        // Calculates kits for all coats and appends them to system array
        
    }
}
