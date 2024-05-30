//
//  EpoxyCoveBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct EpoxyCoveBuildSubmitButton: View {
    
    @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
    
    var body: some View {
        
        NavigationLink(destination: EpoxyCoveBuildSuite(epoxyCoveSystem: epoxyCoveSystem)
            .onAppear {
                epoxyCoveSystem.getAllKits()
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

struct EpoxyCoveBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyCoveSystem()
        
        EpoxyCoveBuildSubmitButton(epoxyCoveSystem: mockSystem)
    }
}
