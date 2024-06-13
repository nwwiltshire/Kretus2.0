//
//  EpoxyColorQuartzCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct EpoxyColorQuartzCoatOptions: View {
    
    @ObservedObject var epoxyColorQuartzSystem: EpoxyColorQuartzSystem
    
    var body: some View {
        VStack {
            HStack {
                Text("Sub System")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $epoxyColorQuartzSystem.subType, label: Text("")) {
                    ForEach(EpoxyColorQuartzSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
            )
            if (epoxyColorQuartzSystem.subType == .sg) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $epoxyColorQuartzSystem.thickness, label: Text("")) {
                        ForEach(EpoxyColorQuartzSystem.Thickness.allCases, id: \.self) { subType in Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
                )
            }
            VStack {
                if (epoxyColorQuartzSystem.subType != .db) {
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
                    get: { self.epoxyColorQuartzSystem.primeCoat != nil },
                    set: { if !$0 { self.epoxyColorQuartzSystem.primeCoat = nil } else { self.epoxyColorQuartzSystem.primeCoat = TSCoat() } }
                )) {
                    Text("Prime Coat")
                }
                Toggle(isOn: Binding(
                    get: { self.epoxyColorQuartzSystem.mvrCoat != nil },
                    set: { if !$0 { self.epoxyColorQuartzSystem.mvrCoat = nil } else { self.epoxyColorQuartzSystem.mvrCoat = TSCoat() } }
                )) {
                    Text("MVR Coat")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
                )
                
                HStack {
                    Text("Cap Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $epoxyColorQuartzSystem.capCoatSubType, label: Text("")) {
                        ForEach(EpoxyColorQuartzSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $epoxyColorQuartzSystem.capMattingAdditive) {
                        Text("Cap Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
                )
                HStack {
                    Text("Top Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $epoxyColorQuartzSystem.topCoatSubType, label: Text("")) {
                        ForEach(EpoxyColorQuartzSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $epoxyColorQuartzSystem.topMattingAdditive) {
                        Text("Top Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
                )
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(epoxyColorQuartzSystem.viewColor).opacity(0.25))
        )
    }
}

struct EpoxyColorQuartzCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyColorQuartzSystem()
        
        EpoxyColorQuartzCoatOptions(epoxyColorQuartzSystem: mockSystem)
    }
}

