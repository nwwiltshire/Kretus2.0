//
//  UPCCoveBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct UPCCoveBuildSubmitButton: View {
    
    @ObservedObject var upcCoveSystem: UPCCoveSystem
    
    var body: some View {
        
        NavigationLink(destination: UPCCoveBuildSuite(upcCoveSystem: upcCoveSystem)
            .onAppear {
                upcCoveSystem.getAllKits()
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

struct UPCCoveBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCCoveSystem()
        
        UPCCoveBuildSubmitButton(upcCoveSystem: mockSystem)
    }
}
