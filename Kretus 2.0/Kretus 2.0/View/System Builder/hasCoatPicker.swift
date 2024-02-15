//
//  hasCoatPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/8/24.
//

import Foundation
import SwiftUI


struct HasCoatPicker: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        VStack {
            Toggle(isOn: $system.hasBaseCoat) {
                Text("Base Coat")
            }
            .disabled(system.hasBaseCoat)
            
            Toggle(isOn: $system.hasPrimeCoat) {
                Text("Prime Coat  (Optional)")
            }
            
            Toggle(isOn: $system.hasTopCoat) {
                Text("Top Coat  (Optional)")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(system.viewColor).opacity(0.25))
        )
    }

    
    
}





struct HasCoatPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = System.getTestSystem()

        // Pass the mock System instance into SystemBuilderView
        HasCoatPicker(system: mockSystem)
    }
}

