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
    
    private func tsCoatConvertToData(tsCoat: TSCoat) -> CoatData {
        
        let newCoat = CoatData(coatType: tsCoat.coatType.description, coatProduct: "Top Shelf Epoxy", covRate: tsCoat.covRate, kits: [])
        
        newCoat.kits = coatConvertKits(coatData: newCoat, kits: tsCoat.kitsNeeded)
        
        return newCoat

    }
    
    private func upcCoatConvertToData(upcCoat: UPCCoat) -> CoatData {
        
        let newCoat = CoatData(coatType: "\(upcCoat.subType.description) \(upcCoat.speed.description)", coatProduct: "Urethane Polymer Concrete", covRate: upcCoat.covRate, kits: [])
        
        newCoat.kits = coatConvertKits(coatData: newCoat, kits: upcCoat.kitsNeeded)
        
        return newCoat

    }
    
    private func paCoatConvertToData(tsCoat: TSCoat) -> CoatData {
        
        let newCoat = CoatData(coatType: tsCoat.coatType.description, coatProduct: "Top Shelf Epoxy", covRate: tsCoat.covRate, kits: [])
        
        newCoat.kits = coatConvertKits(coatData: newCoat, kits: tsCoat.kitsNeeded)
        
        return newCoat

    }
    
    private func puCoatConvertToData(tsCoat: TSCoat) -> CoatData {
        
        let newCoat = CoatData(coatType: tsCoat.coatType.description, coatProduct: "Top Shelf Epoxy", covRate: tsCoat.covRate, kits: [])
        
        newCoat.kits = coatConvertKits(coatData: newCoat, kits: tsCoat.kitsNeeded)
        
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
        
        coats.append(CoatData(coatType: "Base Coat", subType: upcSystem.baseCoat.subType.description, speed: upcSystem.baseCoat.speed.description))
        
        coats.append(CoatData(coatType: "Default", coatProduct: "Default", covRate: 0, kits: coatConvertKits(coatData: <#T##CoatData#>, kits: <#T##[Kit]#>)))
        
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
    
    private func upcColorQuartzConvertToData(upcColorQuartzSystem: UPCColorQuartzSystem) {
        let newSystem = SystemData(name: upcColorQuartzSystem.name, nameFromUser: nameFromUser, descriptionFromUser: descriptionFromUser, imageName: upcColorQuartzSystem.imageName, viewColor: upcColorQuartzSystem.viewColor.description, coats: [], subType: upcColorQuartzSystem.subType.description, systemColor: "", squareFt: upcColorQuartzSystem.squareFt, kits: [])
        
        newSystem.kits = convertKits(systemData: newSystem, kits: upcColorQuartzSystem.kitsNeeded)
        
        newSystem.coats = upcColorQuartzConvertCoats(upcColorQuartzSystem: upcColorQuartzSystem)
        
        saveSystem(systemData: newSystem)

    }
    
    private func upcColorQuartzConvertCoats(upcColorQuartzSystem: UPCColorQuartzSystem) -> [CoatData] {
        
        var coats: [CoatData] = []
        
        coats.append(CoatData(coatType: "Base Coat", subType: upcColorQuartzSystem.baseCoat.subType.description, speed: upcColorQuartzSystem.baseCoat.speed.description))
        
        if let tsCap = upcColorQuartzSystem.capCoat as? TSCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: tsCap.selectedPartA.description, speed: tsCap.speed.description))
        }
        
        if let paCap = upcColorQuartzSystem.capCoat as? PACoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: paCap.subType.description, speed: paCap.speed.description))
        }
        
        if let puCap = upcColorQuartzSystem.capCoat as? PUCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: puCap.subType.description, speed: puCap.speed.description))
        }
        
        if let tsTop = upcColorQuartzSystem.topCoat as? TSCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: tsTop.selectedPartA.description, speed: tsTop.speed.description))
        }
        
        if let paTop = upcColorQuartzSystem.topCoat as? PACoat {
            coats.append(CoatData(coatType: "Top Coat", subType: paTop.subType.description, speed: paTop.speed.description))
        }
        
        if let puTop = upcColorQuartzSystem.topCoat as? PUCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: puTop.subType.description, speed: puTop.speed.description))
        }
        
        if (upcColorQuartzSystem.primeCoat != nil) {
            coats.append(CoatData(coatType: "Prime Coat", subType: upcColorQuartzSystem.primeCoat!.subType.description, speed: upcColorQuartzSystem.primeCoat!.speed.description))
        }
        
        if (upcColorQuartzSystem.mvrCoat != nil) {
            coats.append(CoatData(coatType: "MVR Coat", subType: upcColorQuartzSystem.mvrCoat!.subType.description, speed: upcColorQuartzSystem.mvrCoat!.speed.description))
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
            coats.append(CoatData(coatType: "Base Coat", subType: epoxyColorQuartzSystem.baseCoat!.selectedPartA.description, speed: epoxyColorQuartzSystem.baseCoat!.speed.description))
        } else {
            coats.append(CoatData(coatType: "Base Coat 1", subType: epoxyColorQuartzSystem.baseCoat1!.selectedPartA.description, speed: epoxyColorQuartzSystem.baseCoat1!.speed.description))
            coats.append(CoatData(coatType: "Base Coat 2", subType: epoxyColorQuartzSystem.baseCoat2!.selectedPartA.description, speed: epoxyColorQuartzSystem.baseCoat2!.speed.description))
        }
        
        if let tsCap = epoxyColorQuartzSystem.capCoat as? TSCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: tsCap.selectedPartA.description, speed: tsCap.speed.description))
        }
        
        if let paCap = epoxyColorQuartzSystem.capCoat as? PACoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: paCap.subType.description, speed: paCap.speed.description))
        }
        
        if let puCap = epoxyColorQuartzSystem.capCoat as? PUCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: puCap.subType.description, speed: puCap.speed.description))
        }
        
        if let tsTop = epoxyColorQuartzSystem.topCoat as? TSCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: tsTop.selectedPartA.description, speed: tsTop.speed.description))
        }
        
        if let paTop = epoxyColorQuartzSystem.topCoat as? PACoat {
            coats.append(CoatData(coatType: "Top Coat", subType: paTop.subType.description, speed: paTop.speed.description))
        }
        
        if let puTop = epoxyColorQuartzSystem.topCoat as? PUCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: puTop.subType.description, speed: puTop.speed.description))
        }
        
        if (epoxyColorQuartzSystem.primeCoat != nil) {
            coats.append(CoatData(coatType: "Prime Coat", subType: epoxyColorQuartzSystem.primeCoat!.selectedPartA.description, speed: epoxyColorQuartzSystem.primeCoat!.speed.description))
        }
        
        if (epoxyColorQuartzSystem.mvrCoat != nil) {
            coats.append(CoatData(coatType: "MVR Coat", subType: epoxyColorQuartzSystem.mvrCoat!.selectedPartA.description, speed: epoxyColorQuartzSystem.mvrCoat!.speed.description))
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
            coats.append(CoatData(coatType: "Base Coat", subType: epoxyIndustrialSandSystem.baseCoat!.selectedPartA.description, speed: epoxyIndustrialSandSystem.baseCoat!.speed.description))
        } else {
            coats.append(CoatData(coatType: "Base Coat 1", subType: epoxyIndustrialSandSystem.baseCoat1!.selectedPartA.description, speed: epoxyIndustrialSandSystem.baseCoat1!.speed.description))
            coats.append(CoatData(coatType: "Base Coat 2", subType: epoxyIndustrialSandSystem.baseCoat2!.selectedPartA.description, speed: epoxyIndustrialSandSystem.baseCoat2!.speed.description))
        }
        
        if let tsCap = epoxyIndustrialSandSystem.capCoat as? TSCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: tsCap.selectedPartA.description, speed: tsCap.speed.description))
        }
        
        if let paCap = epoxyIndustrialSandSystem.capCoat as? PACoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: paCap.subType.description, speed: paCap.speed.description))
        }
        
        if let puCap = epoxyIndustrialSandSystem.capCoat as? PUCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: puCap.subType.description, speed: puCap.speed.description))
        }
        
        if let tsTop = epoxyIndustrialSandSystem.topCoat as? TSCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: tsTop.selectedPartA.description, speed: tsTop.speed.description))
        }
        
        if let paTop = epoxyIndustrialSandSystem.topCoat as? PACoat {
            coats.append(CoatData(coatType: "Top Coat", subType: paTop.subType.description, speed: paTop.speed.description))
        }
        
        if let puTop = epoxyIndustrialSandSystem.topCoat as? PUCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: puTop.subType.description, speed: puTop.speed.description))
        }
        
        if (epoxyIndustrialSandSystem.primeCoat != nil) {
            coats.append(CoatData(coatType: "Prime Coat", subType: epoxyIndustrialSandSystem.primeCoat!.selectedPartA.description, speed: epoxyIndustrialSandSystem.primeCoat!.speed.description))
        }
        
        if (epoxyIndustrialSandSystem.mvrCoat != nil) {
            coats.append(CoatData(coatType: "MVR Coat", subType: epoxyIndustrialSandSystem.mvrCoat!.selectedPartA.description, speed: epoxyIndustrialSandSystem.mvrCoat!.speed.description))
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
            coats.append(CoatData(coatType: "Base Coat", subType: upcIndustrialSandSystem.baseCoat!.subType.description, speed: upcIndustrialSandSystem.baseCoat!.speed.description))
        } else {
            coats.append(CoatData(coatType: "Base Coat 1", subType: upcIndustrialSandSystem.baseCoat1!.subType.description, speed: upcIndustrialSandSystem.baseCoat1!.speed.description))
            coats.append(CoatData(coatType: "Base Coat 2", subType: upcIndustrialSandSystem.baseCoat2!.subType.description, speed: upcIndustrialSandSystem.baseCoat2!.speed.description))
        }
        
        if let tsCap = upcIndustrialSandSystem.capCoat as? TSCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: tsCap.selectedPartA.description, speed: tsCap.speed.description))
        }
        
        if let paCap = upcIndustrialSandSystem.capCoat as? PACoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: paCap.subType.description, speed: paCap.speed.description))
        }
        
        if let puCap = upcIndustrialSandSystem.capCoat as? PUCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: puCap.subType.description, speed: puCap.speed.description))
        }
        
        if let upcCap = upcIndustrialSandSystem.capCoat as? UPCCoat {
            coats.append(CoatData(coatType: "Cap Coat", subType: upcCap.subType.description, speed: upcCap.speed.description))
        }
        
        if let tsTop = upcIndustrialSandSystem.topCoat as? TSCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: tsTop.selectedPartA.description, speed: tsTop.speed.description))
        }
        
        if let paTop = upcIndustrialSandSystem.topCoat as? PACoat {
            coats.append(CoatData(coatType: "Top Coat", subType: paTop.subType.description, speed: paTop.speed.description))
        }
        
        if let puTop = upcIndustrialSandSystem.topCoat as? PUCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: puTop.subType.description, speed: puTop.speed.description))
        }
        
        if let upcTop = upcIndustrialSandSystem.topCoat as? UPCCoat {
            coats.append(CoatData(coatType: "Top Coat", subType: upcTop.subType.description, speed: upcTop.speed.description))
        }
        
        if (upcIndustrialSandSystem.primeCoat != nil) {
            coats.append(CoatData(coatType: "Prime Coat", subType: upcIndustrialSandSystem.primeCoat!.subType.description, speed: upcIndustrialSandSystem.primeCoat!.speed.description))
        }
        
        if (upcIndustrialSandSystem.mvrCoat != nil) {
            coats.append(CoatData(coatType: "MVR Coat", subType: upcIndustrialSandSystem.mvrCoat!.subType.description, speed: upcIndustrialSandSystem.mvrCoat!.speed.description))
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
