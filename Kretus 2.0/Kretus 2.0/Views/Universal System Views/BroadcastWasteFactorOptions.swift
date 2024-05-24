//
//  BroadcastWasteFactorOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation
import SwiftUI

struct BroadcastWasteFactorOptions: View {
    
    @ObservedObject var broadCast: Broadcast
    
    var body: some View {
        HStack {
            
            Stepper("Broadcast Waste Factor: \(broadCast.wasteFactor.description) kit(s)", value: $broadCast.wasteFactor)
            
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.gray).opacity(0.25))
                )
        }
    }
}

struct BroadcastWasteFactorOptions_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockBroadCast = ColorChipBroadcast()

        // Pass the mock System instance into SystemBuilderView
        BroadcastWasteFactorOptions(broadCast: mockBroadCast)
    }
}
