//
//  ColorChipBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct ColorChipBuildSubmitButton: View {
    
    @ObservedObject var colorChipSystem: ColorChipSystem
    
    @State private var showSheet = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        NavigationLink(destination: ColorChipBuildSuite(colorChipSystem: colorChipSystem)
            .onAppear {
                colorChipSystem.getAllKits()
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





struct ColorChipBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCBuildSubmitButton(upcSystem: mockSystem)
    }
}
