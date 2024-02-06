//
//  ColorPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/6/24.
//

import Foundation
import SwiftUI

struct ColorPicker: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        VStack {
            HStack {
                Text("Select Sub Type")
                    .font(.headline)
                    .padding()
                    .colorInvert()
                
                Picker(selection: $system.subType, label: Text("")) {
                    ForEach(system.availableSubTypes, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .colorInvert()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(system.viewColor))
                    .frame(maxWidth: .infinity)
            )
            .padding()
        }
    }
}




struct ColorPicker_Previews: PreviewProvider {
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
        ColorPicker(system: mockSystem)
    }
}
