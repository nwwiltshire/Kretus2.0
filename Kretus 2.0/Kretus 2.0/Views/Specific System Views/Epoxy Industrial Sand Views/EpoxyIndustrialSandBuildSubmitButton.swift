//
//  EpoxyIndustrialSandBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct EpoxyIndustrialSandBuildSubmitButton: View {
 
    @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem
    
    var body: some View {
        NavigationLink(destination: EpoxyIndustrialSandBuildSuite(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
            .onAppear {
                epoxyIndustrialSandSystem.getAllKits()
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

struct EpoxyIndustrialSandBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyIndustrialSandSystem()

        EpoxyIndustrialSandBuildSubmitButton(epoxyIndustrialSandSystem: mockSystem)
    }
}
