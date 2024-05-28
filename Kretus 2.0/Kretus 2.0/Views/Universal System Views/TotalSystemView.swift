//
//  TotalKitsListView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI


struct TotalSystemView: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        VStack {
            Text("Total System\n")
                .font(.title)
            Text("Square Feet: \(system.squareFt)")
            if let upcSystem = system as? UPCSystem {
              Text("System Color: \(upcSystem.systemColor)")
            }
            Text("\nTotal Kits Needed:")
            KitsListView(kits: system.kitsNeeded)
            Text("Total kits from waste factor: \(system.totalWasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(system.viewColor).opacity(0.25))
        )
    }
}





struct TotalSystemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockSystem.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return TotalSystemView(system: mockSystem)
    }
}
