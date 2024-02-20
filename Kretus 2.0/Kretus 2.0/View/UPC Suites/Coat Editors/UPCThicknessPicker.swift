//
//  UPCBaseCoatEditor.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/17/24.
//

import Foundation
import SwiftUI

struct UPCThicknessPicker: View {
    
    @ObservedObject var coat: UPCCoat
    
    var body: some View {
        
        VStack {
            
            Text("Coat Thickness:")
            
            if (coat.subType == .rc) {
                Picker(selection: $coat.thickness, label: Text("")) {
                    ForEach(UPCSystem.Thickness.allCases.prefix(3), id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            } else {
                Picker(selection: $coat.thickness, label: Text("")) {
                    ForEach(UPCSystem.Thickness.allCases.suffix(3), id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
            )
    }
}

struct UPCThicknessPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCCoat()

        // Pass the mock System instance into SystemBuilderView
        UPCThicknessPicker(coat: mockSystem)
    }
}
