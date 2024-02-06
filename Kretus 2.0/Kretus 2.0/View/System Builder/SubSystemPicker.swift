//
//  SubTypePicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/5/24.
//

import Foundation
import SwiftUI

struct SubSystemPicker: View {
    
    @ObservedObject var system: System
    
    @State private var selectedSubSystem: System.SubType = .rc {
        didSet {
            system.subType = selectedSubSystem
        }
    }
    
    var body: some View {
        HStack {
            Text("Sub System")
                .font(.headline)
                .padding()
            
            Picker(selection: $selectedSubSystem, label: Text("")) {
                ForEach(system.availableSubTypes, id: \.self) { subType in
                    Text(subType.description).tag(subType)
                }
            }
            .padding()
            .pickerStyle(MenuPickerStyle())
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(system.viewColor).opacity(0.25))
        )
    }
}





struct SubSystemPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem(id: 0,
                                   name: "UPC 1-Coat",
                                   description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
                                   imageName: "default",
                                   viewColor: "UPC",
                                   availableSubTypes: [.rc, .tt, .sl, .mf],
                                   availableSystemColors: [.unpigmented, .black, .blue, .bone, .brown, .clay, .gray, .green, .mustard, .red],
                                   subType: .none,
                                   systemColor: .unpigmented,
                                   baseCoat: UPCCoat(),
                                   primeCoat: UPCCoat(),
                                   topCoat: UPCCoat(),
                                   squareFt: 0,
                                   totalkitsNeeded: [])

        // Pass the mock System instance into SystemBuilderView
        SubSystemPicker(system: mockSystem)
    }
}
