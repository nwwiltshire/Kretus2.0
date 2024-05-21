//
//  CoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct UPCCoatEditorView: View {
    
    @ObservedObject var upcSystem: UPCSystem
    @State private var testOutput = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Modify the coats to your needs, and proceed to view your calculated System.")
                    .font(.subheadline)
                
                UPCBaseCoatSuite(upcCoat: upcSystem.baseCoat)
                
                if (upcSystem.primeCoat != nil) {
                    UPCPrimeCoatSuite(upcCoat: upcSystem.primeCoat!)
                }
                
                if (upcSystem.topCoat != nil) {
                    UPCTopCoatSuite(upcCoat: upcSystem.topCoat!)
                }
                
                UPCBuildSubmitButton(upcSystem: upcSystem)
            }
            .padding(.all)
        }
        .navigationTitle("Coat Options")
    }
}

struct UPCCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCCoatEditorView(upcSystem: mockSystem)
    }
}
