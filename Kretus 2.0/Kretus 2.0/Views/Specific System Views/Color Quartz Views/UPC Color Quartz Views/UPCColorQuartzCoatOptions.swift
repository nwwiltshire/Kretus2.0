//
//  UPCColorQuartzCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct UPCColorQuartzCoatOptions: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    var body: some View {
        VStack {
            HStack {
                Text("Hardener")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $upcColorQuartzSystem.subType, label: Text("")) {
                    ForEach(UPCColorQuartzSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
            )
            if (upcColorQuartzSystem.subType != .rc) {
                VStack {
                    Text("Thickness")
                    Picker(selection: $upcColorQuartzSystem.thickness, label: Text("")) {
                        if (upcColorQuartzSystem.subType == .tt) {
                            ForEach(UPCSystem.Thickness.allCases.indices, id: \.self) { index in
                                let subType = UPCSystem.Thickness.allCases[index]
                                if index == UPCSystem.Thickness.allCases.count - 4 || index == UPCSystem.Thickness.allCases.count - 1 {
                                    Text(subType.description).tag(subType)
                                }
                            }
                        } else if (upcColorQuartzSystem.subType == .sl || upcColorQuartzSystem.subType == .mf) {
                            ForEach(UPCSystem.Thickness.allCases.suffix(2), id: \.self) { subType in Text(subType.description).tag(subType)
                            }
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
                )
            }
                VStack {
                    Toggle(isOn: .constant(true)) {
                        Text("Base Coat")
                    }
                    .disabled(true)
                    .foregroundColor(.gray)
                    Toggle(isOn: Binding(
                        get: { self.upcColorQuartzSystem.primeCoat != nil },
                        set: { if !$0 { self.upcColorQuartzSystem.primeCoat = nil } else { self.upcColorQuartzSystem.primeCoat = UPCCoat() } }
                    )) {
                        Text("Prime Coat")
                    }
                    Toggle(isOn: Binding(
                        get: { self.upcColorQuartzSystem.mvrCoat != nil },
                        set: { if !$0 { self.upcColorQuartzSystem.mvrCoat = nil } else { self.upcColorQuartzSystem.mvrCoat = UPCCoat() } }
                    )) {
                        Text("MVR Coat")
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Text("Cap Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $upcColorQuartzSystem.capCoatSubType, label: Text("")) {
                        ForEach(UPCColorQuartzSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $upcColorQuartzSystem.capMattingAdditive) {
                        Text("Cap Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
                )
                HStack {
                    Text("Top Coat Type")
                    
                    Spacer()
                    
                    Picker(selection: $upcColorQuartzSystem.topCoatSubType, label: Text("")) {
                        ForEach(UPCColorQuartzSystem.CapAndTopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
                    )
                HStack {
                    Toggle(isOn: $upcColorQuartzSystem.topMattingAdditive) {
                        Text("Top Coat Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
                )
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(upcColorQuartzSystem.viewColor).opacity(0.25))
        )
    }
}

struct UPCColorQuartzCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCColorQuartzSystem()
        
        UPCColorQuartzCoatOptions(upcColorQuartzSystem: mockSystem)
    }
}

/*
 struct UPCColorQuartzCoatOptions: View {
     
     @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
     
     var body: some View {
         Text("Hello")
     }
 }

 struct UPCColorQuartzCoatOptions_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = UPCColorQuartzSystem()
         
         UPCColorQuartzCoatOptions(upcColorQuartzSystem: mockSystem)
     }
 }
 */
