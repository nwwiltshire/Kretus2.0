//
//  UPCTotalSystem.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/16/24.
//

import Foundation
import SwiftUI

struct UPCTotalSystem: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("Total System\n")
                        .font(.title3)
                    Text("Square Feet: \(upcSystem.squareFt)")
                    Text("System Color: \(upcSystem.systemColor)")
                    Text("\nTotal Kits Needed:")
                    HStack {
                        Text("ID")
                        Spacer()
                        Text("Name")
                        Spacer()
                        Text("Quantity")
                    }
                    ForEach(upcSystem.kitsNeeded, id: \.id) { kit in
                        VStack {
                            HStack {
                                Text(kit.product.id)
                                    .font(.caption)
                                Spacer()
                                Text(kit.product.name)
                                    .font(.caption)
                                Spacer()
                                Text(kit.quantity.description)
                                    .font(.caption)
                            }
                        }
                    }
                    Text("Total kits from waste factor: \(upcSystem.totalWasteFactor)")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(upcSystem.viewColor).opacity(0.25))
                )
            }
        }
    }
}





struct UPCTotalSystem_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockSystem.baseCoat.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return UPCTotalSystem(upcSystem: mockSystem)
    }
}


