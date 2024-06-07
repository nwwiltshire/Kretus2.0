//
//  EpoxyColorQuartzBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct EpoxyColorQuartzBuildSubmitButton: View {
    
    @ObservedObject var epoxyColorQuartzSystem: EpoxyColorQuartzSystem
    
    var body: some View {
        NavigationLink(destination: EpoxyColorQuartzBuildSuite(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
            .onAppear {
                epoxyColorQuartzSystem.getAllKits()
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





struct EpoxyColorQuartzBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = EpoxyColorQuartzSystem()

        // Pass the mock System instance into SystemBuilderView
        EpoxyColorQuartzBuildSubmitButton(epoxyColorQuartzSystem: mockSystem)
    }
}
