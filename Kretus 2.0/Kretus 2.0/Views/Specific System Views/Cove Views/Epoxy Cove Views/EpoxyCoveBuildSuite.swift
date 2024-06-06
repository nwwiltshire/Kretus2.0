//
//  EpoxyCoveBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct EpoxyCoveBuildSuite: View {
    
    @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView{
            TotalSystemView(system: epoxyCoveSystem)
            TSCoatBuild(tsCoat: epoxyCoveSystem.primeCoat, viewColor: epoxyCoveSystem.viewColor)
            TSCoatBuild(tsCoat: epoxyCoveSystem.bodyCoat, viewColor: epoxyCoveSystem.viewColor)
            TSCoatBuild(tsCoat: epoxyCoveSystem.capCoat, viewColor: epoxyCoveSystem.viewColor)
            
            if (epoxyCoveSystem.broadcast != nil) {
                ColorChipBroadcastBuild(broadCast: epoxyCoveSystem.broadcast!, viewColor: epoxyCoveSystem.viewColor)
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
        .navigationTitle(epoxyCoveSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: epoxyCoveSystem)
        }
    }
}

struct EpoxyCoveBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyCoveSystem()
        
        EpoxyCoveBuildSuite(epoxyCoveSystem: mockSystem)
    }
}
