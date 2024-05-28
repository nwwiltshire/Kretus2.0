//
//  UPCUniversalCoatSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/22/24.
//

import Foundation
import SwiftUI

struct UPCUniversalCoatSuite: View {
    
    @ObservedObject var upcCoat: UPCCoat
    
    var body: some View {
        VStack {
            Text("\(upcCoat.coatType)")
                .font(.title2)
            
            UPCSpeedPicker(coat: upcCoat)
            CoatWasteFactorOptions(coat: upcCoat)
            UPCCoatColorPicker(upcCoat: upcCoat)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
}





struct UPCUniversalCoatSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = UPCCoat()

        // Pass the mock System instance into SystemBuilderView
        UPCUniversalCoatSuite(upcCoat: mockCoat)
    }
}
