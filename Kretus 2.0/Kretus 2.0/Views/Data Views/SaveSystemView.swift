//
//  SaveSystemView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/15/24.
//

import Foundation
import SwiftUI

struct SaveSystemView: View {
    
    @ObservedObject var system: System
    @State private var nameFromUser = ""
    @State private var descriptionFromUser = ""
    @Environment(\.modelContext) private var context
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
                Form {
                    Text("Enter a name and description for your system.")
                        .bold()
                    TextField("Name", text: $nameFromUser)
                    TextField("Description", text: $descriptionFromUser)
                    TotalSystemView(system: system)
                        .padding()
                }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Save System")
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            if let upcSystem = system as? UPCSystem {
                                upcSave(upcSystem: upcSystem)
                                dismiss()
                            } else {
                                dismiss()
                            }
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func systemSaveIdentifier(system: System) {
        
    }
    
    private func upcSave(upcSystem: UPCSystem) {
        let newSystem = SystemData(name: upcSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcSystem.imageName, viewColor: upcSystem.viewColor.description, coats: [], subType: upcSystem.subType.description, speeds: [], systemColor: upcSystem.systemColor.description, squareFt: upcSystem.squareFt, kits: [])
        
        newSystem.kits = upcConvertKits(systemData: newSystem, upcKits: upcSystem.kitsNeeded)
        
        newSystem.speeds = upcFindSpeeds(system: upcSystem)
        
        newSystem.coats = upcConvertCoats(upcSystem: upcSystem)
        
        context.insert(newSystem)
        
        // Save the changes to persistent storage
        do {
          try context.save()
          // Handle success (optional)
        } catch {
          // Handle error (optional)
          print(error.localizedDescription)
        }
    }
    
    private func upcConvertKits(systemData: SystemData, upcKits: [Kit]) -> [KitRelationship] {
      var convertedKits: [KitRelationship] = []

      for upcKit in upcKits {
        let kitData = KitData(id: upcKit.product.id, name: upcKit.product.name, quantity: upcKit.quantity)
        let relationship = KitRelationship(systemData: systemData, kit: kitData)
        convertedKits.append(relationship)
      }

      return convertedKits
    }
    
    private func upcConvertCoats(upcSystem: UPCSystem) -> [CoatData] {
        var coats: [CoatData] = []
        
        coats.append(CoatData(coatType: "Base Coat", subType: upcSystem.baseCoat.subType.description, speed: upcSystem.baseCoat.speed.description))
        
        if (upcSystem.primeCoat != nil) {
            coats.append(CoatData(coatType: "Prime Coat", subType: (upcSystem.primeCoat?.subType.description)!, speed: (upcSystem.primeCoat?.speed.description)!))
        }
        
        if (upcSystem.topCoat != nil) {
            coats.append(CoatData(coatType: "Top Coat", subType: (upcSystem.topCoat?.subType.description)!, speed: (upcSystem.topCoat?.speed.description)!))
        }
        
        print(coats)
        return coats
    }
    
    private func upcFindSpeeds(system: UPCSystem) -> [String] {
        var speeds: [String] = []
        
        switch system.baseCoat.speed {
        case .ez:
            speeds.append("EZ")
        case .ap:
            speeds.append("AP")
        case .fc:
            speeds.append("FC")
        }
        
        if let primeCoat = system.primeCoat {
            switch primeCoat.speed {
            case .ez:
                speeds.append("EZ")
            case .ap:
                speeds.append("AP")
            case .fc:
                speeds.append("FC")
            }
        }
        
        if let topCoat = system.topCoat {
            switch topCoat.speed {
            case .ez:
                speeds.append("EZ")
            case .ap:
                speeds.append("AP")
            case .fc:
                speeds.append("FC")
            }
        }
        
        return speeds
    }

}



struct SaveSystemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        SaveSystemView(system: mockSystem)
    }
}
