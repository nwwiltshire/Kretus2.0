//
//  SubTypePicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/5/24.
//

import Foundation
import SwiftUI

struct SubTypePicker: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        HStack {
            Text("Select Sub Type")
                .font(.headline)
                .padding()
            
            Picker(selection: $system.subType, label: Text("")) {
                ForEach(system.availableSubTypes, id: \.self) { subType in
                    Text(subType.description).tag(subType)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(system.viewColor).opacity(0.25))
        )
        .padding()
    }
}




struct SubTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem(id: 0,
                                   name: "UPC 1-Coat",
                                   description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
                                   imageName: "default",
                                   viewColor: "UPC",
                                   availableSubTypes: [.rc, .tt, .sl, .mf],
                                   subType: .none,
                                   baseCoat: UPCCoat(),
                                   primeCoat: UPCCoat(),
                                   topCoat: UPCCoat(),
                                   squareFt: 0,
                                   totalkitsNeeded: [])

        // Pass the mock System instance into SystemBuilderView
        SubTypePicker(system: mockSystem)
    }
}
