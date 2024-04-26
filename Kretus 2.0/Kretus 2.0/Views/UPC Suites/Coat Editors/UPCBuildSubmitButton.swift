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
    
    @State private var showSheet = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        
        Button(action: {
            showSheet.toggle()
            upcSystem.getAllKits()
        }) {
            HStack {
              Text("View System")
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
        .sheet(isPresented: $showSheet) {
            ScrollView {
                UPCBuildSuite(upcSystem: upcSystem)
            }
            Button("Dismiss", action: { showSheet.toggle() })
                .padding()
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
