//
//  UPCIndustrialSandBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct UPCIndustrialSandBuildSubmitButton: View {
 
    @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem
    
    var body: some View {
        NavigationLink(destination: UPCIndustrialSandBuildSuite(upcIndustrialSandSystem: upcIndustrialSandSystem)
            .onAppear {
                upcIndustrialSandSystem.getAllKits()
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

struct UPCIndustrialSandBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCIndustrialSandSystem()

        UPCIndustrialSandBuildSubmitButton(upcIndustrialSandSystem: mockSystem)
    }
}
