//
//  UPCBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/15/24.
//

import Foundation
import SwiftUI

struct UPCBuildSuite: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    var body: some View {
        VStack {
            Text("\(upcSystem.name)")
                .font(.title)
                .padding()
            VStack {
                Text("System\n")
                    .font(.title3)
                Text("Square Feet: \(upcSystem.squareFt)")
                Text("System Color: \(upcSystem.systemColor)")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcSystem.viewColor).opacity(0.25))
            )
            VStack {
                Text("Base Coat")
                    .font(.title3)
                    .padding()
                Text("Kits Needed")
                HStack {
                    Text("Name")
                    Spacer()
                    Text("ID")
                    Spacer()
                    Text("Quantity")
                }
                ForEach(upcSystem.baseCoat.kitsNeeded, id: \.id) { kit in
                            VStack {
                                HStack {
                                    Text(kit.product.name)
                                        .font(.caption)
                                    Spacer()
                                    Text(kit.product.id)
                                        .font(.caption)
                                    Spacer()
                                    Text(kit.quantity.description)
                                        .font(.caption)
                                }
                            }
                        }
                Text("Coverage Rate: \(upcSystem.baseCoat.covRate)")
                Text("Thickness: \(upcSystem.baseCoat.thickness)")
                Text("Part A: \(upcSystem.baseCoat.partA)")
                Text("Part B: \(upcSystem.baseCoat.partB)")
                Text("Part C: \(upcSystem.baseCoat.partC)")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcSystem.viewColor).opacity(0.25))
            )
                if ((upcSystem.primeCoat) != nil) {
                    VStack {
                        Text("Prime Coat")
                            .font(.title3)
                            .padding()
                        Text("Kits Needed")
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("ID")
                            Spacer()
                            Text("Quantity")
                        }
                        
                        ForEach(upcSystem.primeCoat!.kitsNeeded, id: \.id) { kit in
                                    VStack {
                                        HStack {
                                            Text(kit.product.name)
                                                .font(.caption)
                                            Spacer()
                                            Text(kit.product.id)
                                                .font(.caption)
                                            Spacer()
                                            Text(kit.quantity.description)
                                                .font(.caption)
                                        }
                                    }
                                }
                        Spacer()
                        Text("Coverage Rate: \(upcSystem.primeCoat!.covRate)")
                        Text("Thickness: \(upcSystem.primeCoat!.thickness)")
                        Text("Part A: \(upcSystem.primeCoat!.partA)")
                        Text("Part B: \(upcSystem.primeCoat!.partB)")
                        Text("Part C: \(upcSystem.primeCoat!.partC)")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(upcSystem.viewColor).opacity(0.25))
                    )
                }
            
            if ((upcSystem.topCoat) != nil) {
                VStack {
                    Text("Top Coat")
                        .font(.title3)
                        .padding()
                    Text("Kits Needed")
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("ID")
                        Spacer()
                        Text("Quantity")
                    }
                    
                    ForEach(upcSystem.topCoat!.kitsNeeded, id: \.id) { kit in
                                VStack {
                                    HStack {
                                        Text(kit.product.name)
                                            .font(.caption)
                                        Spacer()
                                        Text(kit.product.id)
                                            .font(.caption)
                                        Spacer()
                                        Text(kit.quantity.description)
                                            .font(.caption)
                                    }
                                }
                            }
                    Spacer()
                    Text("Coverage Rate: \(upcSystem.topCoat!.covRate)")
                    Text("Thickness: \(upcSystem.topCoat!.thickness)")
                    Text("Part A: \(upcSystem.topCoat!.partA)")
                    Text("Part B: \(upcSystem.topCoat!.partB)")
                    Text("Part C: \(upcSystem.topCoat!.partC)")
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





struct UPCBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockSystem.baseCoat.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return UPCBuildSuite(upcSystem: mockSystem)
    }
}


