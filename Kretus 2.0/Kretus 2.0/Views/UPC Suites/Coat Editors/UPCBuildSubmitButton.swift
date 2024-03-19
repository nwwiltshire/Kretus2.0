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
    
    var body: some View {
        
        Button(action: {
              self.showNewView = true
            }) {
              Text("Save System")
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
