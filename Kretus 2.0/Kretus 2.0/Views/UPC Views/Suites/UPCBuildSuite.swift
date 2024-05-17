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
    
    //let systemData: UPCSystemData?
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            VStack {
                UPCTotalSystem(upcSystem: upcSystem)
                VStack {
                    Text("Base Coat")
                        .font(.title3)
                    Text("Coverage Rate: \(upcSystem.baseCoat.covRate)")
                    Text("Thickness: \(upcSystem.baseCoat.thickness)")
                    Text("\nKits Needed:")
                    HStack {
                        Text("ID")
                        Spacer()
                        Text("Name")
                        Spacer()
                        Text("Quantity")
                    }
                    ForEach(upcSystem.baseCoat.kitsNeeded, id: \.id) { kit in
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
                    Text("Kits from waste factor: \(upcSystem.baseCoat.wasteFactor)")
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
                        Text("Coverage Rate: \(upcSystem.primeCoat!.covRate)")
                        Text("Thickness: \(upcSystem.primeCoat!.thickness)")
                        Text("\nKits Needed:")
                        HStack {
                            Text("ID")
                            Spacer()
                            Text("Name")
                            Spacer()
                            Text("Quantity")
                        }
                        
                        ForEach(upcSystem.primeCoat!.kitsNeeded, id: \.id) { kit in
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
                        Text("Kits from waste factor: \(upcSystem.primeCoat!.wasteFactor)")
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
                        Text("Coverage Rate: \(upcSystem.topCoat!.covRate)")
                        Text("Thickness: \(upcSystem.topCoat!.thickness)")
                        Text("\nKits Needed:")
                        HStack {
                            Text("ID")
                            Spacer()
                            Text("Name")
                            Spacer()
                            Text("Quantity")
                        }
                        
                        ForEach(upcSystem.topCoat!.kitsNeeded, id: \.id) { kit in
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
                        Text("Kits from waste factor: \(upcSystem.topCoat!.wasteFactor)")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(upcSystem.viewColor).opacity(0.25))
                    )
                }
            }
            Button(action: {
                isEditing = true
            }) {
                HStack {
                    Text("Save System")
                        .font(.title)
                        .padding()
                    
                    Spacer()
                    
                    Image(systemName: "chevron.up")
                        .padding()
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

        }
        .navigationTitle(upcSystem.name)
        .sheet(isPresented: $isEditing) {
            UPCSaveSystemView(upcSystem: upcSystem)
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

