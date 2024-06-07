//
//  EpoxyIndustrialSandCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct EpoxyIndustrialSandCoatOptions: View {
 
    @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem

    var body: some View {
        VStack {
            HStack {
                Text("Sub System")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $epoxyIndustrialSandSystem.subType, label: Text("")) {
                    ForEach(EpoxyIndustrialSandSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
            )
            if (epoxyIndustrialSandSystem.subType == .sg) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $epoxyIndustrialSandSystem.thickness, label: Text("")) {
                        ForEach(EpoxyIndustrialSandSystem.Thickness.allCases, id: \.self) { subType in Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
                )
            }
            VStack {
                if (epoxyIndustrialSandSystem.subType != .db) {
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
                    get: { self.epoxyIndustrialSandSystem.primeCoat != nil },
                    set: { if !$0 { self.epoxyIndustrialSandSystem.primeCoat = nil } else { self.epoxyIndustrialSandSystem.primeCoat = TSCoat() } }
                )) {
                    Text("Prime Coat")
                }
                Toggle(isOn: Binding(
                    get: { self.epoxyIndustrialSandSystem.mvrCoat != nil },
                    set: { if !$0 { self.epoxyIndustrialSandSystem.mvrCoat = nil } else { self.epoxyIndustrialSandSystem.mvrCoat = TSCoat() } }
                )) {
                    Text("MVR Coat")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
                )
                
                HStack {
                    Text("Cap Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $epoxyIndustrialSandSystem.capCoatSubType, label: Text("")) {
                        ForEach(EpoxyIndustrialSandSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $epoxyIndustrialSandSystem.capMattingAdditive) {
                        Text("Cap Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
                )
                HStack {
                    Text("Top Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $epoxyIndustrialSandSystem.topCoatSubType, label: Text("")) {
                        ForEach(EpoxyIndustrialSandSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $epoxyIndustrialSandSystem.topMattingAdditive) {
                        Text("Top Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
                )
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(epoxyIndustrialSandSystem.viewColor).opacity(0.25))
        )
    }
}

struct EpoxyIndustrialSandCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyIndustrialSandSystem()

        EpoxyIndustrialSandCoatOptions(epoxyIndustrialSandSystem: mockSystem)
    }
}

/*
 struct EpoxyIndustrialSandCoatOptions: View {
  
     @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem

     var body: some View {
         Text("Hello")
         
     }
 }

 struct EpoxyIndustrialSandCoatOptions_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = EpoxyIndustrialSandSystem()

         EpoxyIndustrialSandCoatOptions(epoxyIndustrialSandSystem: mockSystem)
     }
 }
 */
