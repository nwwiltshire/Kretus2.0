//
//  SubTypePicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/5/24.
//

import Foundation
import SwiftUI

struct UPCSubSystemPicker: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    var body: some View {
        HStack {
            Text("Sub System")
                .font(.headline)
                .padding()
            
            Spacer()
            
            Picker(selection: $upcSystem.subType, label: Text("")) {
                ForEach(UPCSystem.SubType.allCases, id: \.self) { subType in
                    Text(subType.description).tag(subType)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(upcSystem.viewColor).opacity(0.25))
            )
    }
}





struct UPCSubSystemPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCSubSystemPicker(upcSystem: mockSystem)
    }
}
