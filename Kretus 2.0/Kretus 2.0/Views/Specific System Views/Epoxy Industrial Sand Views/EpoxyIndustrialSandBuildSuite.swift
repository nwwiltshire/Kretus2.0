//
//  EpoxyIndustrialSandBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct EpoxyIndustrialSandBuildSuite: View {
 
    @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem
    
    @State private var isEditing = false

    var body: some View {
        ScrollView {
            
            TotalSystemView(system: epoxyIndustrialSandSystem)
            
            if (epoxyIndustrialSandSystem.subType != .db) {
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.baseCoat!, viewColor: epoxyIndustrialSandSystem.viewColor)
                BroadcastBuild(broadcast: epoxyIndustrialSandSystem.broadcast!, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else {
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.baseCoat1!, viewColor: epoxyIndustrialSandSystem.viewColor)
                BroadcastBuild(broadcast: epoxyIndustrialSandSystem.broadcast1!, viewColor: epoxyIndustrialSandSystem.viewColor)
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.baseCoat2!, viewColor: epoxyIndustrialSandSystem.viewColor)
                BroadcastBuild(broadcast: epoxyIndustrialSandSystem.broadcast2!, viewColor: epoxyIndustrialSandSystem.viewColor)
            }
            
            if (epoxyIndustrialSandSystem.capCoat is TSCoat) {
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.capCoat as! TSCoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else if (epoxyIndustrialSandSystem.capCoat is PACoat) {
                PACoatBuild(paCoat: epoxyIndustrialSandSystem.capCoat as! PACoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else if (epoxyIndustrialSandSystem.capCoat is PUCoat) {
                PUCoatBuild(puCoat: epoxyIndustrialSandSystem.capCoat as! PUCoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else if (epoxyIndustrialSandSystem.capCoat is UPCCoat) {
                UPCCoatBuild(upcCoat: epoxyIndustrialSandSystem.capCoat as! UPCCoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            }
            
            if (epoxyIndustrialSandSystem.topCoat is TSCoat) {
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.topCoat as! TSCoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else if (epoxyIndustrialSandSystem.topCoat is PACoat) {
                PACoatBuild(paCoat: epoxyIndustrialSandSystem.topCoat as! PACoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else if (epoxyIndustrialSandSystem.topCoat is PUCoat) {
                PUCoatBuild(puCoat: epoxyIndustrialSandSystem.topCoat as! PUCoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            } else if (epoxyIndustrialSandSystem.topCoat is UPCCoat) {
                UPCCoatBuild(upcCoat: epoxyIndustrialSandSystem.topCoat as! UPCCoat, viewColor: epoxyIndustrialSandSystem.viewColor)
            }
            
            if (epoxyIndustrialSandSystem.primeCoat != nil) {
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.primeCoat!, viewColor: epoxyIndustrialSandSystem.viewColor)
            }
            
            if (epoxyIndustrialSandSystem.mvrCoat != nil) {
                TSCoatBuild(tsCoat: epoxyIndustrialSandSystem.mvrCoat!, viewColor: epoxyIndustrialSandSystem.viewColor)
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
        .navigationTitle(epoxyIndustrialSandSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: epoxyIndustrialSandSystem)
        }
    }
}

struct EpoxyIndustrialSandBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyIndustrialSandSystem()

        EpoxyIndustrialSandBuildSuite(epoxyIndustrialSandSystem: mockSystem)
    }
}
