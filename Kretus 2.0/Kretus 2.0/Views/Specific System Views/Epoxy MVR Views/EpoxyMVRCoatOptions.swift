//
//  EpoxyMVRCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRCoatOptions: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    var body: some View {
        
        VStack {
            Text("Thickness")
            Picker(selection: $epoxyMVRSystem.thickness, label: Text("")) {
                ForEach(TSCoat.Thickness.allCases.indices, id: \.self) { index in
                    let subType = TSCoat.Thickness.allCases[index]
                    if index == TSCoat.Thickness.allCases.count - 4 || index == TSCoat.Thickness.allCases.count - 5 {
                        Text(subType.description).tag(subType)
                    }
                }
            }
            .pickerStyle(PalettePickerStyle())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(epoxyMVRSystem.viewColor).opacity(0.25))
        )
        
        HStack {
            Toggle(isOn: $epoxyMVRSystem.hasPrimeCoat) {
                Text("Prime Coat")
            }
        }
    .padding()
    .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(epoxyMVRSystem.viewColor).opacity(0.25))
        )
        
    }
    
}

struct EpoxyMVRCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRCoatOptions(epoxyMVRSystem: mockSystem)
    }
}
