//
//  UPCCoveBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct UPCCoveBuildSuite: View {
    
    @ObservedObject var upcCoveSystem: UPCCoveSystem
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView{
            TotalSystemView(system: upcCoveSystem)
            
            UPCCoatBuild(upcCoat: upcCoveSystem.primeCoat, viewColor: upcCoveSystem.viewColor)
            UPCCoatBuild(upcCoat: upcCoveSystem.bodyCoat, viewColor: upcCoveSystem.viewColor)
            UPCCoatBuild(upcCoat: upcCoveSystem.capCoat, viewColor: upcCoveSystem.viewColor)
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
        .navigationTitle(upcCoveSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: upcCoveSystem)
        }
    }
}

struct UPCCoveBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCCoveSystem()
        
        UPCCoveBuildSuite(upcCoveSystem: mockSystem)
    }
}
