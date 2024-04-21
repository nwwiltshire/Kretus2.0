//
//  UPCBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/15/24.
//

import Foundation
import SwiftUI

struct UPCBuildSubmitButton: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    @State private var showNewView = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        
        Button(action: {
            showNewView = true
            printedText = upcSystem.printSystemTest()
        }) {
            Text("View System")
        }
        
        if (showNewView) {
            UPCBuildSuite(upcSystem: upcSystem)
        }
    }
}





struct UPCBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCBuildSubmitButton(upcSystem: mockSystem)
    }
}
