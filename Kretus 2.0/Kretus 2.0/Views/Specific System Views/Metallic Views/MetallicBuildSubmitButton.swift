//
//  MetallicBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

struct MetallicBuildSubmitButton: View {
 
    @ObservedObject var metallicSystem: MetallicSystem
    
    var body: some View {
        NavigationLink(destination: MetallicBuildSuite(metallicSystem: metallicSystem)
            .onAppear {
                metallicSystem.getAllKits()
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

struct MetallicBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = MetallicSystem()

        MetallicBuildSubmitButton(metallicSystem: mockSystem)
    }
}
