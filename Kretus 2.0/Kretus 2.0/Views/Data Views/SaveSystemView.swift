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
    
    private func upcConvertToData(upcSystem: UPCSystem) {
        let newSystem = SystemData(name: upcSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcSystem.imageName, viewColor: upcSystem.viewColor.description, coats: [], subType: upcSystem.subType.description, systemColor: upcSystem.systemColor.description, squareFt: upcSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: upcSystem.kitsNeeded)
        
        newSystem.coats = upcConvertCoats(upcSystem: upcSystem)
        
        saveSystem(systemData: newSystem)

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
        
        if let upcBase = colorChipSystem.baseCoat as? UPCCoat {
            coats.append(CoatData(coatType: "Base Coat", subType: upcBase.subType.description, speed: upcBase.speed.description))
        }
        
        if let tsBase = colorChipSystem.baseCoat as? TSCoat {
            coats.append(CoatData(coatType: "Base Coat", subType: tsBase.selectedPartA.description, speed: tsBase.speed.description))
        }
        
        if let paBase = colorChipSystem.baseCoat as? PACoat {
            coats.append(CoatData(coatType: "Base Coat", subType: paBase.subType.description, speed: paBase.speed.description))
        }
        
        if (colorChipSystem.primeCoat != nil) {
            if let upcPrime = colorChipSystem.primeCoat as? UPCCoat {
                coats.append(CoatData(coatType: "Prime Coat", subType: upcPrime.subType.description, speed: upcPrime.speed.description))
            }
            
            if let tsPrime = colorChipSystem.primeCoat as? TSCoat {
                coats.append(CoatData(coatType: "Prime Coat", subType: tsPrime.selectedPartA.description, speed: tsPrime.speed.description))
            }
            
            if let paPrime = colorChipSystem.primeCoat as? PACoat {
                coats.append(CoatData(coatType: "Prime Coat", subType: paPrime.subType.description, speed: paPrime.speed.description))
            }
        }
        
        if (colorChipSystem.mvrCoat != nil) {
            
            if let tsMvr = colorChipSystem.primeCoat as? TSCoat {
                coats.append(CoatData(coatType: "MVR Coat", subType: tsMvr.selectedPartA.description, speed: tsMvr.speed.description))
            }
        }
        
        coats.append(CoatData(coatType: "Top Coat", subType: colorChipSystem.topCoat1.subType.description, speed: colorChipSystem.topCoat1.speed.description))
        
        if (colorChipSystem.topCoat2 != nil) {
            if let tc2Pa = colorChipSystem.topCoat2 as? PACoat {
                coats.append(CoatData(coatType: "Top Coat 2", subType: tc2Pa.subType.description, speed: tc2Pa.speed.description))
            }
            
            if let tc2Pu = colorChipSystem.topCoat2 as? PUCoat {
                coats.append(CoatData(coatType: "Top Coat 2", subType: tc2Pu.subType.description, speed: tc2Pu.speed.description))
            }
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
        
        if let upcCoat1 = colorSplashSystem.coat1 as? UPCCoat {
            coats.append(CoatData(coatType: "Coat 1", subType: upcCoat1.subType.description, speed: upcCoat1.speed.description))
        }
        
        if let tsCoat1 = colorSplashSystem.coat1 as? TSCoat {
            coats.append(CoatData(coatType: "Coat 1", subType: tsCoat1.selectedPartA.description, speed: tsCoat1.speed.description))
        }
        if let tsCoat2 = colorSplashSystem.coat2 as? TSCoat {
            coats.append(CoatData(coatType: "Coat 2", subType: tsCoat2.selectedPartA.description, speed: tsCoat2.speed.description))
        }
        if let tsCoat3 = colorSplashSystem.coat3 as? TSCoat {
            coats.append(CoatData(coatType: "Coat 3", subType: tsCoat3.selectedPartA.description, speed: tsCoat3.speed.description))
        }
        
        if let paCoat1 = colorSplashSystem.coat1 as? PACoat {
            coats.append(CoatData(coatType: "Coat 1", subType: paCoat1.subType.description, speed: paCoat1.speed.description))
        }
        
        if let paCoat2 = colorSplashSystem.coat2 as? PACoat {
            coats.append(CoatData(coatType: "Coat 2", subType: paCoat2.subType.description, speed: paCoat2.speed.description))
        }
        
        if let paCoat3 = colorSplashSystem.coat3 as? PACoat {
            coats.append(CoatData(coatType: "Coat 3", subType: paCoat3.subType.description, speed: paCoat3.speed.description))
        }
        
        if let puCoat1 = colorSplashSystem.coat1 as? PUCoat {
            coats.append(CoatData(coatType: "Coat 1", subType: puCoat1.subType.description, speed: puCoat1.speed.description))
        }
        if let puCoat2 = colorSplashSystem.coat2 as? PUCoat {
            coats.append(CoatData(coatType: "Coat 2", subType: puCoat2.subType.description, speed: puCoat2.speed.description))
        }
        if let puCoat3 = colorSplashSystem.coat3 as? PUCoat {
            coats.append(CoatData(coatType: "Coat 3", subType: puCoat3.subType.description, speed: puCoat3.speed.description))
        }
        
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
        
        coats.append(CoatData(coatType: "MVR Coat", subType: epoxyMVRSystem.mvrCoat.selectedPartA.description, speed: epoxyMVRSystem.mvrCoat.speed.description))
        
        if (epoxyMVRSystem.primeCoat != nil) {
            coats.append(CoatData(coatType: "Prime Coat", subType: epoxyMVRSystem.primeCoat!.selectedPartA.description, speed: epoxyMVRSystem.primeCoat!.speed.description))
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
        
        coats.append(CoatData(coatType: "Prime Coat", subType: epoxyCoveSystem.primeCoat.selectedPartA.description, speed: epoxyCoveSystem.primeCoat.speed.description))
        
        coats.append(CoatData(coatType: "Body Coat", subType: epoxyCoveSystem.bodyCoat.selectedPartA.description, speed: epoxyCoveSystem.bodyCoat.speed.description))
        
        coats.append(CoatData(coatType: "Cap Coat", subType: epoxyCoveSystem.capCoat.selectedPartA.description, speed: epoxyCoveSystem.capCoat.speed.description))
        
        return coats
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
