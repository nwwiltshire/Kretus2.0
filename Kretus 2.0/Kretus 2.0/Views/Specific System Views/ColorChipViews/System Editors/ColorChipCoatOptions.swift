//
//  ColorChipCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/21/24.
//

import Foundation
import SwiftUI


struct ColorChipCoatOptions: View {
    
    @ObservedObject var colorChipSystem: ColorChipSystem
    
    var body: some View {
        VStack {
            Toggle(isOn: .constant(true)) {
                Text("Base Coat")
            }
            .disabled(true)
            .foregroundColor(.gray)
            
            if (colorChipSystem.subType == .ts) {
                Toggle(isOn: Binding(
                    get: { self.colorChipSystem.primeCoat != nil },
                    set: { if !$0 { self.colorChipSystem.primeCoat = nil } else { self.colorChipSystem.primeCoat = TSCoat() } }
                )) {
                    Text("Prime Coat")
                }
                
                Toggle(isOn: Binding(
                    get: { self.colorChipSystem.mvrCoat != nil },
                    set: { if !$0 { self.colorChipSystem.mvrCoat = nil } else { self.colorChipSystem.mvrCoat = TSCoat() } }
                )) {
                    Text("MVR Coat")
                }
            } else if (colorChipSystem.subType == .pa) {
                Toggle(isOn: Binding(
                    get: { self.colorChipSystem.primeCoat != nil },
                    set: { if !$0 { self.colorChipSystem.primeCoat = nil } else { self.colorChipSystem.primeCoat = PACoat() } } // Set this later, override others as well
                )) {
                    Text("Prime Coat")
                }
                
                Toggle(isOn: Binding(
                    get: { self.colorChipSystem.mvrCoat != nil },
                    set: { if !$0 { self.colorChipSystem.mvrCoat = nil } else { self.colorChipSystem.mvrCoat = TSCoat() } }
                )) {
                    Text("MVR Coat")
                }
            } else {
                Toggle(isOn: Binding(
                    get: { self.colorChipSystem.primeCoat != nil },
                    set: { if !$0 { self.colorChipSystem.primeCoat = nil } else { self.colorChipSystem.primeCoat = UPCCoat() } } // Set this later, override others as well
                )) {
                    Text("Prime Coat")
                }
            }
            Toggle(isOn: .constant(true)) {
                Text("Top Coat")
            }
            .disabled(true)
            .foregroundColor(.gray)
            Toggle(isOn: Binding(
                get: { self.colorChipSystem.topCoat2 != nil },
                set: { if !$0 { self.colorChipSystem.topCoat2 = nil } else { self.colorChipSystem.topCoat2 = PACoat() } }
            )) {
                Text("Top Coat 2")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(colorChipSystem.viewColor).opacity(0.25))
        )
    }

    
    
}





struct ColorCHipCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipCoatOptions(colorChipSystem: mockSystem)
    }
}
