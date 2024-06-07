//
//  EpoxyIndustrialSandCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct UPCIndustrialSandCoatOptions: View {
 
    @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem

    var body: some View {
        VStack {
            HStack {
                Text("Sub System")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $upcIndustrialSandSystem.subType, label: Text("")) {
                    ForEach(UPCIndustrialSandSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
            )
            if (upcIndustrialSandSystem.subType == .rc) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $upcIndustrialSandSystem.thickness, label: Text("")) {
                        ForEach(UPCIndustrialSandSystem.Thickness.allCases.indices, id: \.self) { index in
                            let subType = UPCIndustrialSandSystem.Thickness.allCases[index]
                            if index == UPCIndustrialSandSystem.Thickness.allCases.count - 2 || index == UPCIndustrialSandSystem.Thickness.allCases.count - 3 {
                                Text(subType.description).tag(subType)
                            }
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
            }
            if (upcIndustrialSandSystem.subType == .tt) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $upcIndustrialSandSystem.thickness, label: Text("")) {
                        ForEach(UPCIndustrialSandSystem.Thickness.allCases.indices, id: \.self) { index in
                            let subType = UPCIndustrialSandSystem.Thickness.allCases[index]
                            if index == UPCIndustrialSandSystem.Thickness.allCases.count - 2 || index == UPCIndustrialSandSystem.Thickness.allCases.count - 1 {
                                Text(subType.description).tag(subType)
                            }
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
            }
            if (upcIndustrialSandSystem.subType == .sl) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $upcIndustrialSandSystem.thickness, label: Text("")) {
                        ForEach(UPCIndustrialSandSystem.Thickness.allCases.indices, id: \.self) { index in
                            let subType = UPCIndustrialSandSystem.Thickness.allCases[index]
                            if index == UPCIndustrialSandSystem.Thickness.allCases.count - 2 || index == UPCIndustrialSandSystem.Thickness.allCases.count - 1 {
                                Text(subType.description).tag(subType)
                            }
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
            }
            if (upcIndustrialSandSystem.subType == .mf) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $upcIndustrialSandSystem.thickness, label: Text("")) {
                        ForEach(UPCIndustrialSandSystem.Thickness.allCases.indices, id: \.self) { index in
                            let subType = UPCIndustrialSandSystem.Thickness.allCases[index]
                            if index == UPCIndustrialSandSystem.Thickness.allCases.count - 2 || index == UPCIndustrialSandSystem.Thickness.allCases.count - 1 {
                                Text(subType.description).tag(subType)
                            }
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
            }
            VStack {
                if (upcIndustrialSandSystem.subType != .dbrc) {
                    Toggle(isOn: .constant(true)) {
                        Text("Base Coat")
                    }
                    .disabled(true)
                    .foregroundColor(.gray)
                } else {
                    Toggle(isOn: .constant(true)) {
                        Text("Base Coats")
                    }
                    .disabled(true)
                    .foregroundColor(.gray)
                }
                
                Toggle(isOn: Binding(
                    get: { self.upcIndustrialSandSystem.primeCoat != nil },
                    set: { if !$0 { self.upcIndustrialSandSystem.primeCoat = nil } else { self.upcIndustrialSandSystem.primeCoat = UPCCoat() } }
                )) {
                    Text("Prime Coat")
                }
                Toggle(isOn: Binding(
                    get: { self.upcIndustrialSandSystem.mvrCoat != nil },
                    set: { if !$0 { self.upcIndustrialSandSystem.mvrCoat = nil } else { self.upcIndustrialSandSystem.mvrCoat = UPCCoat() } }
                )) {
                    Text("MVR Coat")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
                
                HStack {
                    Text("Cap Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $upcIndustrialSandSystem.capCoatSubType, label: Text("")) {
                        ForEach(UPCIndustrialSandSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $upcIndustrialSandSystem.capMattingAdditive) {
                        Text("Cap Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
                HStack {
                    Text("Top Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $upcIndustrialSandSystem.topCoatSubType, label: Text("")) {
                        ForEach(UPCIndustrialSandSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $upcIndustrialSandSystem.topMattingAdditive) {
                        Text("Top Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
                )
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(upcIndustrialSandSystem.viewColor).opacity(0.25))
        )
    }
}

struct UPCIndustrialSandCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCIndustrialSandSystem()

        UPCIndustrialSandCoatOptions(upcIndustrialSandSystem: mockSystem)
    }
}

/*
 struct EpoxyIndustrialSandCoatOptions: View {
  
     @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem

     var body: some View {
         Text("Hello")
         
     }
 }

 struct EpoxyIndustrialSandCoatOptions_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = UPCIndustrialSandSystem()

         EpoxyIndustrialSandCoatOptions(upcIndustrialSandSystem: mockSystem)
     }
 }
 */
