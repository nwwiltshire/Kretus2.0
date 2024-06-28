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
    
    @State private var showSuccessIcon: Bool = false
    
    var body: some View {
        ZStack {
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
                                    upcConvertToData(upcSystem: upcSystem)
                                }
                                if let colorChipSystem = system as? ColorChipSystem {
                                    colorChipConvertToData(colorChipSystem: colorChipSystem)
                                }
                                if let colorSplashSystem = system as? ColorSplashSystem {
                                    colorSplashConvertToData(colorSplashSystem: colorSplashSystem)
                                }
                                if let epoxyMVRSystem = system as? EpoxyMVRSystem {
                                    epoxyMVRConvertToData(epoxyMVRSystem: epoxyMVRSystem)
                                }
                                if let epoxyCoveSystem = system as? EpoxyCoveSystem {
                                    epoxyCoveConvertToData(epoxyCoveSystem: epoxyCoveSystem)
                                }
                                if let upcColorQuartzSystem = system as? UPCColorQuartzSystem {
                                    upcColorQuartzConvertToData(upcColorQuartzSystem: upcColorQuartzSystem)
                                }
                                if let epoxyColorQuartzSystem = system as? EpoxyColorQuartzSystem {
                                    epoxyColorQuartzConvertToData(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
                                }
                                if let epoxyIndustrialSandSystem = system as? EpoxyIndustrialSandSystem {
                                    epoxyIndustrialSandConvertToData(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
                                }
                                if let upcIndustrialSandSystem = system as? UPCIndustrialSandSystem {
                                    UPCIndustrialSandConvertToData(upcIndustrialSandSystem: upcIndustrialSandSystem)
                                }
                                if let metallicSystem = system as? MetallicSystem {
                                    metallicConvertToData(metallicSystem: metallicSystem)
                                }
                                if let esdSystem = system as? ESDSystem {
                                    esdConvertToData(esdSystem: esdSystem)
                                }
                                showSuccessIcon = true
                                _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
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
            if showSuccessIcon {
                SuccessIcon() // Show the animation if successful
            }
        }
    }
    
    private func saveSystem(systemData: SystemData) {
        
        context.insert(systemData)
        
        // Save the changes to persistent storage
        do {
          try context.save()
          // Handle success (optional)
        } catch {
          // Handle error (optional)
          print(error.localizedDescription)
        }
    }
    
    private func convertKits(systemData: SystemData, kits: [Kit]) -> [KitRelationship] {
      var convertedKits: [KitRelationship] = []

      for kit in kits {
        let kitData = KitData(id: kit.product.id, name: kit.product.name, quantity: kit.quantity)
        let relationship = KitRelationship(systemData: systemData, kit: kitData)
        convertedKits.append(relationship)
      }

      return convertedKits
        
    }
    
    private func coatConvertKits(coatData: CoatData, kits: [Kit]) -> [CoatKitRelationship] {
        
      var convertedKits: [CoatKitRelationship] = []

      for kit in kits {
        let kitData = KitData(id: kit.product.id, name: kit.product.name, quantity: kit.quantity)
        let relationship = CoatKitRelationship(coatData: coatData, kit: kitData)
        convertedKits.append(relationship)
      }

      return convertedKits
        
    }
    
    private func coatConvertToData(coat: Coat) -> CoatData {
        
        var newCoat = CoatData(coatType: "Default", coatProduct: "Default", covRate: 0, kits: [])
        
        if (coat.name != "UPC") {
            newCoat = CoatData(coatType: coat.coatType.description, coatProduct: coat.name, covRate: coat.covRate, kits: [])
        } else {
            newCoat = CoatData(coatType: "\(String(describing: (coat as? UPCCoat)?.subType.description)) \(String(describing: (coat as? UPCCoat)?.speed.description))", coatProduct: "Urethane Polymer Concrete", covRate: coat.covRate, kits: [])
        }
        
        newCoat.kits = coatConvertKits(coatData: newCoat, kits: coat.kitsNeeded)
        
        return newCoat

    }
    
    private func upcConvertToData(upcSystem: UPCSystem) {
        let newSystem = SystemData(name: upcSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcSystem.imageName, viewColor: upcSystem.viewColor.description, coats: [], subType: upcSystem.subType.description, systemColor: upcSystem.systemColor.description, squareFt: upcSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: upcSystem.kitsNeeded)
        
        newSystem.coats = upcConvertCoats(upcSystem: upcSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func upcConvertCoats(upcSystem: UPCSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(coatConvertToData(coat: upcSystem.baseCoat))
        
        if (upcSystem.primeCoat != nil) {
            coats.append(coatConvertToData(coat: upcSystem.primeCoat!))
        }
        
        if (upcSystem.topCoat != nil) {
            coats.append(coatConvertToData(coat: upcSystem.topCoat!))
        }
        
        return coats
    }
    
    private func colorChipConvertToData(colorChipSystem: ColorChipSystem) {
        let newSystem = SystemData(name: colorChipSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: colorChipSystem.imageName, viewColor: colorChipSystem.viewColor.description, coats: [], subType: colorChipSystem.subType.description, systemColor: "", squareFt: colorChipSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: colorChipSystem.kitsNeeded)
        
        newSystem.coats = colorChipConvertCoats(colorChipSystem: colorChipSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func colorChipConvertCoats(colorChipSystem: ColorChipSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(coatConvertToData(coat: colorChipSystem.baseCoat))
        
        if (colorChipSystem.primeCoat != nil) {
            
            coats.append(coatConvertToData(coat: colorChipSystem.primeCoat!))
            
        }
        
        if (colorChipSystem.mvrCoat != nil) {
            coats.append(coatConvertToData(coat: colorChipSystem.mvrCoat as! TSCoat))
        }
        
        coats.append(coatConvertToData(coat: colorChipSystem.topCoat1))

        if (colorChipSystem.topCoat2 != nil) {
            
            coats.append(coatConvertToData(coat: colorChipSystem.topCoat2!))
            
        }
        
        return coats
    }
    
    private func colorSplashConvertToData(colorSplashSystem: ColorSplashSystem) {
        let newSystem = SystemData(name: colorSplashSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: colorSplashSystem.imageName, viewColor: colorSplashSystem.viewColor.description, coats: [], subType: "Color Splash", systemColor: "", squareFt: colorSplashSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: colorSplashSystem.kitsNeeded)
        
        newSystem.coats = colorSplashConvertCoats(colorSplashSystem: colorSplashSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func colorSplashConvertCoats(colorSplashSystem: ColorSplashSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(coatConvertToData(coat: colorSplashSystem.coat1!))
        coats.append(coatConvertToData(coat: colorSplashSystem.coat2!))
        coats.append(coatConvertToData(coat: colorSplashSystem.coat3!))
        
        return coats
    }
    
    private func epoxyMVRConvertToData(epoxyMVRSystem: EpoxyMVRSystem) {
        let newSystem = SystemData(name: epoxyMVRSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: epoxyMVRSystem.imageName, viewColor: epoxyMVRSystem.viewColor.description, coats: [], subType: "Epoxy MVR", systemColor: "", squareFt: epoxyMVRSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: epoxyMVRSystem.kitsNeeded)
        
        newSystem.coats = epoxyMVRConvertCoats(epoxyMVRSystem: epoxyMVRSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func epoxyMVRConvertCoats(epoxyMVRSystem: EpoxyMVRSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(coatConvertToData(coat: epoxyMVRSystem.mvrCoat))
        
        if (epoxyMVRSystem.primeCoat != nil) {
            coats.append(coatConvertToData(coat: epoxyMVRSystem.primeCoat!))
        }
        
        return coats
    }
    
    private func epoxyCoveConvertToData(epoxyCoveSystem: EpoxyCoveSystem) {
        let newSystem = SystemData(name: epoxyCoveSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: epoxyCoveSystem.imageName, viewColor: epoxyCoveSystem.viewColor.description, coats: [], subType: epoxyCoveSystem.subType.description, systemColor: "", squareFt: epoxyCoveSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: epoxyCoveSystem.kitsNeeded)
        
        newSystem.coats = epoxyCoveConvertCoats(epoxyCoveSystem: epoxyCoveSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func epoxyCoveConvertCoats(epoxyCoveSystem: EpoxyCoveSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(coatConvertToData(coat: epoxyCoveSystem.primeCoat))
        
        coats.append(coatConvertToData(coat: epoxyCoveSystem.bodyCoat))
        
        coats.append(coatConvertToData(coat: epoxyCoveSystem.capCoat))
        
        return coats
    }
    
    private func upcColorQuartzConvertToData(upcColorQuartzSystem: UPCColorQuartzSystem) {
        let newSystem = SystemData(name: upcColorQuartzSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcColorQuartzSystem.imageName, viewColor: upcColorQuartzSystem.viewColor.description, coats: [], subType: upcColorQuartzSystem.subType.description, systemColor: "", squareFt: upcColorQuartzSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: upcColorQuartzSystem.kitsNeeded)
        
        newSystem.coats = upcColorQuartzConvertCoats(upcColorQuartzSystem: upcColorQuartzSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func upcColorQuartzConvertCoats(upcColorQuartzSystem: UPCColorQuartzSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(coatConvertToData(coat: upcColorQuartzSystem.baseCoat))
        coats.append(coatConvertToData(coat: upcColorQuartzSystem.capCoat))
        coats.append(coatConvertToData(coat: upcColorQuartzSystem.topCoat))
        
        if (upcColorQuartzSystem.primeCoat != nil) {
            coats.append(coatConvertToData(coat: upcColorQuartzSystem.primeCoat!))
        }
        
        if (upcColorQuartzSystem.mvrCoat != nil) {
            coats.append(coatConvertToData(coat: upcColorQuartzSystem.mvrCoat!))
        }
        
        return coats
        
    }
    
    private func epoxyColorQuartzConvertToData(epoxyColorQuartzSystem: EpoxyColorQuartzSystem) {
        let newSystem = SystemData(name: epoxyColorQuartzSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: epoxyColorQuartzSystem.imageName, viewColor: epoxyColorQuartzSystem.viewColor.description, coats: [], subType: epoxyColorQuartzSystem.subType.description, systemColor: "", squareFt: epoxyColorQuartzSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: epoxyColorQuartzSystem.kitsNeeded)
        
        newSystem.coats = epoxyColorQuartzConvertCoats(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func epoxyColorQuartzConvertCoats(epoxyColorQuartzSystem: EpoxyColorQuartzSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        if (epoxyColorQuartzSystem.subType != .db) {
            coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.baseCoat!))
        } else {
            coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.baseCoat1!))
            coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.baseCoat2!))
        }
        
        coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.capCoat))
        coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.topCoat))
        
        if (epoxyColorQuartzSystem.primeCoat != nil) {
            coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.primeCoat!))
        }
        
        if (epoxyColorQuartzSystem.mvrCoat != nil) {
            coats.append(coatConvertToData(coat: epoxyColorQuartzSystem.mvrCoat!))
        }

        return coats
        
    }
    
    private func epoxyIndustrialSandConvertToData(epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem) {
        let newSystem = SystemData(name: epoxyIndustrialSandSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: epoxyIndustrialSandSystem.imageName, viewColor: epoxyIndustrialSandSystem.viewColor.description, coats: [], subType: epoxyIndustrialSandSystem.subType.description, systemColor: "", squareFt: epoxyIndustrialSandSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: epoxyIndustrialSandSystem.kitsNeeded)
        
        newSystem.coats = epoxyIndustrialSandConvertCoats(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
        
        saveSystem(systemData: newSystem)

    }

    private func epoxyIndustrialSandConvertCoats(epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        if (epoxyIndustrialSandSystem.subType != .db) {
            coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.baseCoat!))
        } else {
            coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.baseCoat1!))
            coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.baseCoat2!))
        }
        
        coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.capCoat))
        coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.topCoat))
        
        if (epoxyIndustrialSandSystem.primeCoat != nil) {
            coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.primeCoat!))
        }
        
        if (epoxyIndustrialSandSystem.mvrCoat != nil) {
            coats.append(coatConvertToData(coat: epoxyIndustrialSandSystem.mvrCoat!))
        }

        return coats
        
    }
    
    private func UPCIndustrialSandConvertToData(upcIndustrialSandSystem: UPCIndustrialSandSystem) {
        let newSystem = SystemData(name: upcIndustrialSandSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcIndustrialSandSystem.imageName, viewColor: upcIndustrialSandSystem.viewColor.description, coats: [], subType: upcIndustrialSandSystem.subType.description, systemColor: "", squareFt: upcIndustrialSandSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: upcIndustrialSandSystem.kitsNeeded)
        
        newSystem.coats = upcIndustrialSandConvertCoats(upcIndustrialSandSystem: upcIndustrialSandSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func upcIndustrialSandConvertCoats(upcIndustrialSandSystem: UPCIndustrialSandSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        if (upcIndustrialSandSystem.subType != .dbrc) {
            coats.append(coatConvertToData(coat: upcIndustrialSandSystem.baseCoat!))
        } else {
            coats.append(coatConvertToData(coat: upcIndustrialSandSystem.baseCoat1!))
            coats.append(coatConvertToData(coat: upcIndustrialSandSystem.baseCoat2!))
        }
        
        coats.append(coatConvertToData(coat: upcIndustrialSandSystem.capCoat))
        coats.append(coatConvertToData(coat: upcIndustrialSandSystem.topCoat))
        
        if (upcIndustrialSandSystem.primeCoat != nil) {
            coats.append(coatConvertToData(coat: upcIndustrialSandSystem.primeCoat!))
        }
        
        if (upcIndustrialSandSystem.mvrCoat != nil) {
            coats.append(coatConvertToData(coat: upcIndustrialSandSystem.mvrCoat!))
        }

        return coats
        
    }
    
    private func metallicConvertToData(metallicSystem: MetallicSystem) {
        let newSystem = SystemData(name: metallicSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: metallicSystem.imageName, viewColor: metallicSystem.viewColor.description, coats: [], subType: metallicSystem.subType.description, systemColor: "", squareFt: metallicSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: metallicSystem.kitsNeeded)
        
        //newSystem.coats = epoxyColorQuartzConvertCoats(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func esdConvertToData(esdSystem: ESDSystem) {
        let newSystem = SystemData(name: esdSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: esdSystem.imageName, viewColor: esdSystem.viewColor.description, coats: [], subType: esdSystem.subType.description, systemColor: "", squareFt: esdSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: esdSystem.kitsNeeded)
        
        saveSystem(systemData: newSystem)

    }

}

struct SuccessIcon: View {
    
  @State private var animate = false

  var body: some View {
      withAnimation(.easeInOut) {
          ZStack {
              RoundedRectangle(cornerRadius: 20)
                          .fill(.ultraThinMaterial)
                          .frame(width: 250, height: 250)
              HStack {
                  Image(systemName: "checkmark.circle")
                      .foregroundColor(.green)
                      .scaleEffect(animate ? 1.2 : 1.0)
                  Text("System Saved!")
                      .font(.title)
              }
          }
          .transition(.opacity)
      }
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
