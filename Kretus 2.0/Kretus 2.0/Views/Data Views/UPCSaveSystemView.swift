//
//  SaveSystemView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/15/24.
//

import Foundation
import SwiftUI

struct UPCSaveSystemView: View {
    
    @ObservedObject var upcSystem: UPCSystem
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
                    UPCTotalSystem(upcSystem: upcSystem)
                        .padding()
                }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Save System")
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            save(upcSystem: upcSystem)
                            dismiss()
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
    
    private func save(upcSystem: UPCSystem) {
        let newSystem = SystemData(name: upcSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcSystem.imageName, viewColor: upcSystem.viewColor.description, subType: upcSystem.subType.description, systemColor: upcSystem.systemColor.description, squareFt: upcSystem.squareFt, kits: [])
        
        newSystem.kits = convertUPCKits(systemData: newSystem, upcKits: upcSystem.kitsNeeded)
        
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
    
    private func convertUPCKits(systemData: SystemData, upcKits: [Kit]) -> [KitRelationship] {
      var convertedKits: [KitRelationship] = []

      for upcKit in upcKits {
        let kitData = KitData(id: upcKit.product.id, name: upcKit.product.name, quantity: upcKit.quantity)
        let relationship = KitRelationship(systemData: systemData, kit: kitData)
        convertedKits.append(relationship)
      }

      return convertedKits
    }
}



struct UPCSaveSystemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCSaveSystemView(upcSystem: mockSystem)
    }
}
