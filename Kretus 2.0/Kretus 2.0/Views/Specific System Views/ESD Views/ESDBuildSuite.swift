//
//  ESDBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ESDBuildSuite: View {
    
    @ObservedObject var esdSystem: ESDSystem
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            
            TotalSystemView(system: esdSystem)
            
            TSCoatBuild(tsCoat: esdSystem.mvrCoat, viewColor: esdSystem.viewColor)
            
            if (esdSystem.conductivePrimer != nil) {
                ConductivePrimerCoatBuild(conductivePrimer: esdSystem.conductivePrimer!, viewColor: esdSystem.viewColor)
            }
            
            PACoatBuild(paCoat: esdSystem.topCoat, viewColor: esdSystem.viewColor)
            
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
        .navigationTitle(esdSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: esdSystem)
        }
    }
    
}
struct ESDBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ESDSystem()
        
        ESDBuildSuite(esdSystem: mockSystem)
    }
}
