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
    
    // State variable to hold the printed system test
    @State private var printedText: String? = nil
    
    var body: some View {

        Button(action: {
          // Update the state variable with the printed system test
          printedText = upcSystem.printSystemTest()
        }) {
          Text("View System")
        }

        if let printedText = printedText {
          ScrollView {
            Text(printedText)
          }
        }
        
        /*
        NavigationLink(destination: UPCBuildSuite(upcSystem: upcSystem)) {
            HStack {
                Text("View Build")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
         */
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
