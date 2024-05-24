//
//  UPCBaseCoatSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/19/24.
//
import Foundation
import SwiftUI

struct UPCBaseCoatSuite: View {
    
    @ObservedObject var upcCoat: UPCCoat
    
    var body: some View {
        VStack {
            Text("\(upcCoat.coatType)")
                .font(.title2)
            
            UPCThicknessPicker(coat: upcCoat)
            UPCSpeedPicker(coat: upcCoat)
            CoatWasteFactorOptions(coat: upcCoat)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
}





struct UPCBaseCoatSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = UPCCoat()

        // Pass the mock System instance into SystemBuilderView
        UPCBaseCoatSuite(upcCoat: mockCoat)
    }
}

