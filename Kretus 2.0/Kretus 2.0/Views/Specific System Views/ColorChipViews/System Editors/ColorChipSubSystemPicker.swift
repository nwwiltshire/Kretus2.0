//
//  ColorChipSubSystemPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/21/24.
//

import Foundation
import Foundation
import SwiftUI

struct ColorChipSubSystemPicker: View {
    
    @ObservedObject var colorChipSystem: ColorChipSystem
    
    var body: some View {
        HStack {
            Text("Coat Type")
                .font(.headline)
                .padding()
            
            Spacer()
            
            Picker(selection: $colorChipSystem.subType, label: Text("")) {
                ForEach(ColorChipSystem.SubType.allCases, id: \.self) { subType in
                    Text(subType.description).tag(subType)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(colorChipSystem.viewColor).opacity(0.25))
            )
    }
}





struct ColorChipSubSystemPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipSubSystemPicker(colorChipSystem: mockSystem)
    }
}
