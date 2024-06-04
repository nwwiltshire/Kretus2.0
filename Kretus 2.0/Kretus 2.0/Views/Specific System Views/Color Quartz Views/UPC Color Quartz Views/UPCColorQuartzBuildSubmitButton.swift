//
//  UPCColorQuartzBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct UPCColorQuartzBuildSubmitButton: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    @State private var showSheet = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        NavigationLink(destination: UPCColorQuartzBuildSuite(upcColorQuartzSystem: upcColorQuartzSystem)
            .onAppear {
                upcColorQuartzSystem.getAllKits()
            }) {
                HStack {
                  Text("View System Calculation")
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
    }
}





struct UPCColorQuartzBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCColorQuartzSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCColorQuartzBuildSubmitButton(upcColorQuartzSystem: mockSystem)
    }
}
