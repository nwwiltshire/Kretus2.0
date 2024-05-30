//
//  EpoxyMVRBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRBuildSuite: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    @State private var isEditing = false
    
    var body: some View {
        
        ScrollView {
            
            TotalSystemView(system: epoxyMVRSystem)
            
            TSCoatBuild(tsCoat: epoxyMVRSystem.mvrCoat, viewColor: epoxyMVRSystem.viewColor)
            
            if (epoxyMVRSystem.primeCoat != nil) {
                TSCoatBuild(tsCoat: epoxyMVRSystem.primeCoat!, viewColor: epoxyMVRSystem.viewColor)
            }
            Button(action: {
                isEditing = true
            }) {
                HStack {
                    Text("Save System")
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

        }
        .padding()
        .navigationTitle(epoxyMVRSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: epoxyMVRSystem)
        }
    }
    
}

struct EpoxyMVRBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRBuildSuite(epoxyMVRSystem: mockSystem)
    }
}
