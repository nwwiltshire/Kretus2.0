//
//  UPCIndustrialSandBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct UPCIndustrialSandBuildSuite: View {
 
    @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem
    
    @State private var isEditing = false

    var body: some View {
        ScrollView {
            
            TotalSystemView(system: upcIndustrialSandSystem)
            
            if (upcIndustrialSandSystem.subType != .dbrc) {
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.baseCoat!, viewColor: upcIndustrialSandSystem.viewColor)
                BroadcastBuild(broadcast: upcIndustrialSandSystem.broadcast!, viewColor: upcIndustrialSandSystem.viewColor)
            } else {
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.baseCoat1!, viewColor: upcIndustrialSandSystem.viewColor)
                BroadcastBuild(broadcast: upcIndustrialSandSystem.broadcast1!, viewColor: upcIndustrialSandSystem.viewColor)
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.baseCoat2!, viewColor: upcIndustrialSandSystem.viewColor)
                BroadcastBuild(broadcast: upcIndustrialSandSystem.broadcast2!, viewColor: upcIndustrialSandSystem.viewColor)
            }
            
            if (upcIndustrialSandSystem.capCoat is TSCoat) {
                TSCoatBuild(tsCoat: upcIndustrialSandSystem.capCoat as! TSCoat, viewColor: upcIndustrialSandSystem.viewColor)
            } else if (upcIndustrialSandSystem.capCoat is PACoat) {
                PACoatBuild(paCoat: upcIndustrialSandSystem.capCoat as! PACoat, viewColor: upcIndustrialSandSystem.viewColor)
            } else if (upcIndustrialSandSystem.capCoat is PUCoat) {
                PUCoatBuild(puCoat: upcIndustrialSandSystem.capCoat as! PUCoat, viewColor: upcIndustrialSandSystem.viewColor)
            } else if (upcIndustrialSandSystem.capCoat is UPCCoat) {
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.capCoat as! UPCCoat, viewColor: upcIndustrialSandSystem.viewColor)
            }
            
            if (upcIndustrialSandSystem.topCoat is TSCoat) {
                TSCoatBuild(tsCoat: upcIndustrialSandSystem.topCoat as! TSCoat, viewColor: upcIndustrialSandSystem.viewColor)
            } else if (upcIndustrialSandSystem.topCoat is PACoat) {
                PACoatBuild(paCoat: upcIndustrialSandSystem.topCoat as! PACoat, viewColor: upcIndustrialSandSystem.viewColor)
            } else if (upcIndustrialSandSystem.topCoat is PUCoat) {
                PUCoatBuild(puCoat: upcIndustrialSandSystem.topCoat as! PUCoat, viewColor: upcIndustrialSandSystem.viewColor)
            } else if (upcIndustrialSandSystem.topCoat is UPCCoat) {
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.topCoat as! UPCCoat, viewColor: upcIndustrialSandSystem.viewColor)
            }
            
            if (upcIndustrialSandSystem.primeCoat != nil) {
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.primeCoat!, viewColor: upcIndustrialSandSystem.viewColor)
            }
            
            if (upcIndustrialSandSystem.mvrCoat != nil) {
                UPCCoatBuild(upcCoat: upcIndustrialSandSystem.mvrCoat!, viewColor: upcIndustrialSandSystem.viewColor)
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
        .navigationTitle(upcIndustrialSandSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: upcIndustrialSandSystem)
        }
    }
}

struct UPCIndustrialSandBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCIndustrialSandSystem()

        UPCIndustrialSandBuildSuite(upcIndustrialSandSystem: mockSystem)
    }
}
