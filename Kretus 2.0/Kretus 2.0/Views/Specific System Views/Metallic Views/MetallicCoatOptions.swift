//
//  MetallicCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

struct MetallicCoatOptions: View {
    
    @ObservedObject var metallicSystem: MetallicSystem
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Sub Type")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $metallicSystem.subType, label: Text("")) {
                    ForEach(MetallicSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description)
                            .tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(metallicSystem.viewColor).opacity(0.25))
            )
            VStack {
                Text("Thickness")
                Picker(selection: $metallicSystem.thickness, label: Text("")) {
                    ForEach(MetallicSystem.Thickness.allCases, id: \.self) { subType in Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(metallicSystem.viewColor).opacity(0.25))
            )
            HStack {
                Toggle(isOn: $metallicSystem.primeSolventCleaner) {
                    Text("Prime Coat Solvent Cleaner")
                }
            }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(metallicSystem.viewColor).opacity(0.25))
            )
            HStack {
                Text("Top Coat Sub Type")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                if (metallicSystem.subType == .metallic) {
                    Picker(selection: $metallicSystem.topCoatSubType, label: Text("")) {
                        ForEach(MetallicSystem.TopCoatSubType.allCases, id: \.self) { subType in
                            Text(subType.description)
                                .tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                } else {
                    Picker(selection: $metallicSystem.topCoatSubType, label: Text("")) {
                        ForEach(MetallicSystem.TopCoatSubType.allCases.suffix(2), id: \.self) { subType in
                            Text(subType.description)
                                .tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(metallicSystem.viewColor).opacity(0.25))
            )
            HStack {
                Toggle(isOn: $metallicSystem.topMattingAdditive) {
                    Text("Top Coat Matting Additive")
                }
            }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(metallicSystem.viewColor).opacity(0.25))
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(metallicSystem.viewColor).opacity(0.25))
        )
        
    }
    
}

struct MetallicCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = MetallicSystem()
        
        MetallicCoatOptions(metallicSystem: mockSystem)
    }
}

