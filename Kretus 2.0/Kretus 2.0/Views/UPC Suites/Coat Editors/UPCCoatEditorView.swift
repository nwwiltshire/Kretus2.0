//
//  CoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct CoatEditorView: View {
    
    @ObservedObject var upcSystem: UPCSystem
    @State private var testOutput = ""
    
    var body: some View {
        VStack {
            ScrollView {
                UPCBaseCoatSuite(upcCoat: upcSystem.baseCoat)
                
                if (upcSystem.primeCoat != nil) {
                    UPCPrimeCoatSuite(upcCoat: upcSystem.primeCoat!)
                }
                
                if (upcSystem.topCoat != nil) {
                    UPCTopCoatSuite(upcCoat: upcSystem.topCoat!)
                }
            }
            .padding(.all)
            .navigationTitle("System Options")
            
            Button(action: {
                testOutput = upcSystem.printSystemTest()
            }) {
                Text("Print System Test")
            }
            ScrollView {
                Text(testOutput)
            }
            
        }
    }
}

struct CoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        CoatEditorView(upcSystem: mockSystem)
    }
}
