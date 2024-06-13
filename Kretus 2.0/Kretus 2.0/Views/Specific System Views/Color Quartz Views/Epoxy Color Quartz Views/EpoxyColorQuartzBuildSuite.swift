//
//  EpoxyColorQuartzBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI


struct EpoxyColorQuartzBuildSuite: View {
    
    @ObservedObject var epoxyColorQuartzSystem: EpoxyColorQuartzSystem
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            
            TotalSystemView(system: epoxyColorQuartzSystem)
            
            if (epoxyColorQuartzSystem.subType != .db) {
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.baseCoat!, viewColor: epoxyColorQuartzSystem.viewColor)
                BroadcastBuild(broadcast: epoxyColorQuartzSystem.broadcast!, viewColor: epoxyColorQuartzSystem.viewColor)
            } else {
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.baseCoat1!, viewColor: epoxyColorQuartzSystem.viewColor)
                BroadcastBuild(broadcast: epoxyColorQuartzSystem.broadcast1!, viewColor: epoxyColorQuartzSystem.viewColor)
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.baseCoat2!, viewColor: epoxyColorQuartzSystem.viewColor)
                BroadcastBuild(broadcast: epoxyColorQuartzSystem.broadcast2!, viewColor: epoxyColorQuartzSystem.viewColor)
            }
            
            if (epoxyColorQuartzSystem.capCoat is TSCoat) {
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.capCoat as! TSCoat, viewColor: epoxyColorQuartzSystem.viewColor)
            } else if (epoxyColorQuartzSystem.capCoat is PACoat) {
                PACoatBuild(paCoat: epoxyColorQuartzSystem.capCoat as! PACoat, viewColor: epoxyColorQuartzSystem.viewColor)
            } else if (epoxyColorQuartzSystem.capCoat is PUCoat) {
                PUCoatBuild(puCoat: epoxyColorQuartzSystem.capCoat as! PUCoat, viewColor: epoxyColorQuartzSystem.viewColor)
            }
            
            if (epoxyColorQuartzSystem.topCoat is TSCoat) {
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.topCoat as! TSCoat, viewColor: epoxyColorQuartzSystem.viewColor)
            } else if (epoxyColorQuartzSystem.topCoat is PACoat) {
                PACoatBuild(paCoat: epoxyColorQuartzSystem.topCoat as! PACoat, viewColor: epoxyColorQuartzSystem.viewColor)
            } else if (epoxyColorQuartzSystem.topCoat is PUCoat) {
                PUCoatBuild(puCoat: epoxyColorQuartzSystem.topCoat as! PUCoat, viewColor: epoxyColorQuartzSystem.viewColor)
            }
            
            if (epoxyColorQuartzSystem.primeCoat != nil) {
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.primeCoat!, viewColor: epoxyColorQuartzSystem.viewColor)
            }
            
            if (epoxyColorQuartzSystem.mvrCoat != nil) {
                TSCoatBuild(tsCoat: epoxyColorQuartzSystem.mvrCoat!, viewColor: epoxyColorQuartzSystem.viewColor)
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
        .navigationTitle(epoxyColorQuartzSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: epoxyColorQuartzSystem)
        }
    }
}

struct EpoxyColorQuartzBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyColorQuartzSystem()
        
        EpoxyColorQuartzBuildSuite(epoxyColorQuartzSystem: mockSystem)
    }
}
