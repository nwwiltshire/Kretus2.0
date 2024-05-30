//
//  EpoxyMVRBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRBuildSubmitButton: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    var body: some View {
        
        NavigationLink(destination: EpoxyMVRBuildSuite(epoxyMVRSystem: epoxyMVRSystem)
            .onAppear {
                epoxyMVRSystem.getAllKits()
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

struct EpoxyMVRBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRBuildSubmitButton(epoxyMVRSystem: mockSystem)
    }
}
