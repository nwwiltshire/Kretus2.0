//
//  MetallicBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

struct MetallicBuildSuite: View {
    
    @ObservedObject var metallicSystem: MetallicSystem
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            
            TotalSystemView(system: metallicSystem)
            
            if (metallicSystem.subType == .metallic) {
                TSCoatBuild(tsCoat: metallicSystem.metallicBaseCoat!, viewColor: metallicSystem.viewColor)
                TSCoatBuild(tsCoat: metallicSystem.metallicAccentCoat!, viewColor: metallicSystem.viewColor)
            } else {
                PUCoatBuild(puCoat: metallicSystem.metallicBodyCoat!, viewColor: metallicSystem.viewColor)
            }
            
            TSCoatBuild(tsCoat: metallicSystem.primeCoat, viewColor: metallicSystem.viewColor)
            
            if (metallicSystem.topCoat is TSCoat) {
                TSCoatBuild(tsCoat: metallicSystem.topCoat as! TSCoat, viewColor: metallicSystem.viewColor)
            } else if (metallicSystem.topCoat is PACoat) {
                PACoatBuild(paCoat: metallicSystem.topCoat as! PACoat, viewColor: metallicSystem.viewColor)
            } else if (metallicSystem.topCoat is PUCoat) {
                PUCoatBuild(puCoat: metallicSystem.topCoat as! PUCoat, viewColor: metallicSystem.viewColor)
            } else if (metallicSystem.topCoat is UPCCoat) {
                UPCCoatBuild(upcCoat: metallicSystem.topCoat as! UPCCoat, viewColor: metallicSystem.viewColor)
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
        .navigationTitle(metallicSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: metallicSystem)
        }
    }
    
}

struct MetallicBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = MetallicSystem()
        
        MetallicBuildSuite(metallicSystem: mockSystem)
    }
}
