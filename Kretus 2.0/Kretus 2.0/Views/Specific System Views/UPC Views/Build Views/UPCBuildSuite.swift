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
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            VStack {
                TotalSystemView(system: upcSystem)
                UPCCoatBuild(upcCoat: upcSystem.baseCoat, viewColor: upcSystem.viewColor)
                if ((upcSystem.primeCoat) != nil) {
                    UPCCoatBuild(upcCoat: upcSystem.primeCoat!, viewColor: upcSystem.viewColor)
                }
                
                if ((upcSystem.topCoat) != nil) {
                    UPCCoatBuild(upcCoat: upcSystem.topCoat!, viewColor: upcSystem.viewColor)
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
        .padding()
        .navigationTitle(upcSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: upcSystem)
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


