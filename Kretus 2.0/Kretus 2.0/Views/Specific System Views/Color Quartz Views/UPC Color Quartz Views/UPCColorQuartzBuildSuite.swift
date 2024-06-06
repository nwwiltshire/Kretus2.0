//
//  UPCColorQuartzBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI


struct UPCColorQuartzBuildSuite: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            
            TotalSystemView(system: upcColorQuartzSystem)
            
            UPCCoatBuild(upcCoat: upcColorQuartzSystem.baseCoat, viewColor: upcColorQuartzSystem.viewColor)
            
            if (upcColorQuartzSystem.capCoat is TSCoat) {
                TSCoatBuild(tsCoat: upcColorQuartzSystem.capCoat as! TSCoat, viewColor: upcColorQuartzSystem.viewColor)
            } else if (upcColorQuartzSystem.capCoat is PACoat) {
                PACoatBuild(paCoat: upcColorQuartzSystem.capCoat as! PACoat, viewColor: upcColorQuartzSystem.viewColor)
            } else if (upcColorQuartzSystem.capCoat is PUCoat) {
                PUCoatBuild(puCoat: upcColorQuartzSystem.capCoat as! PUCoat, viewColor: upcColorQuartzSystem.viewColor)
            }
            
            if (upcColorQuartzSystem.topCoat is TSCoat) {
                TSCoatBuild(tsCoat: upcColorQuartzSystem.topCoat as! TSCoat, viewColor: upcColorQuartzSystem.viewColor)
            } else if (upcColorQuartzSystem.topCoat is PACoat) {
                PACoatBuild(paCoat: upcColorQuartzSystem.topCoat as! PACoat, viewColor: upcColorQuartzSystem.viewColor)
            } else if (upcColorQuartzSystem.topCoat is PUCoat) {
                PUCoatBuild(puCoat: upcColorQuartzSystem.topCoat as! PUCoat, viewColor: upcColorQuartzSystem.viewColor)
            }
            
            if (upcColorQuartzSystem.primeCoat != nil) {
                UPCCoatBuild(upcCoat: upcColorQuartzSystem.primeCoat!, viewColor: upcColorQuartzSystem.viewColor)
            }
            
            if (upcColorQuartzSystem.mvrCoat != nil) {
                UPCCoatBuild(upcCoat: upcColorQuartzSystem.mvrCoat!, viewColor: upcColorQuartzSystem.viewColor)
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
        .navigationTitle(upcColorQuartzSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: upcColorQuartzSystem)
        }
    }
}

struct UPCColorQuartzBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCColorQuartzSystem()
        
        UPCColorQuartzBuildSuite(upcColorQuartzSystem: mockSystem)
    }
}
