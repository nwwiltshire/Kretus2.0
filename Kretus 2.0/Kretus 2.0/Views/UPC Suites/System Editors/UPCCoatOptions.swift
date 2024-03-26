//
//  hasCoatPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/8/24.
//

import Foundation
import SwiftUI


struct UPCCoatOptions: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    var body: some View {
        VStack {
            Toggle(isOn: .constant(true)) {
                Text("Base Coat")
            }
            .disabled(true)
            .foregroundColor(.gray)
            
            Toggle(isOn: Binding(
                get: { self.upcSystem.primeCoat != nil },
                set: { if !$0 { self.upcSystem.primeCoat = nil } else { self.upcSystem.primeCoat = upcSystem.createUPCCoat(squareFt: upcSystem.squareFt, coatType: .prime, subType: upcSystem.subType) } } // Set this later, override others as well
            )) {
                Text("Prime Coat")
            }
            
            Toggle(isOn: Binding(
                get: { self.upcSystem.topCoat != nil },
                set: { if !$0 { self.upcSystem.topCoat = nil } else { self.upcSystem.topCoat = upcSystem.createUPCCoat(squareFt: upcSystem.squareFt, coatType: .top, subType: upcSystem.subType) } }
            )) {
                Text("Top Coat")
            }
            Toggle(isOn: $upcSystem.uvResistance) {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("UV Resistance")
                }
            }
            .foregroundColor(self.upcSystem.topCoat == nil ? .gray : .primary)
            .disabled(self.upcSystem.topCoat == nil)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(upcSystem.viewColor).opacity(0.25))
        )
    }

    
    
}





struct UPCCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCCoatOptions(upcSystem: mockSystem)
    }
}

