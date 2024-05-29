//
//  ColorSplashBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct ColorSplashBuildSuite: View {
    
    @ObservedObject var colorSplashSystem: ColorSplashSystem
    
    @State private var isEditing = false
    
    var body: some View {
        
        ScrollView {
            
            TotalSystemView(system: colorSplashSystem)
            
            if (colorSplashSystem.coat1 is TSCoat) {
                TSCoatBuild(tsCoat: colorSplashSystem.coat1 as! TSCoat, viewColor: colorSplashSystem.viewColor)
            } else if (colorSplashSystem.coat1 is PACoat) {
                PACoatBuild(paCoat: colorSplashSystem.coat1 as! PACoat, viewColor: colorSplashSystem.viewColor)
            }
            else if (colorSplashSystem.coat1 is PUCoat) {
                PUCoatBuild(puCoat: colorSplashSystem.coat1 as! PUCoat, viewColor: colorSplashSystem.viewColor)
           }
            else if (colorSplashSystem.coat1 is UPCCoat) {
                UPCCoatBuild(upcCoat: colorSplashSystem.coat1 as! UPCCoat, viewColor: colorSplashSystem.viewColor)
           }
            
            if (colorSplashSystem.coat2 is TSCoat) {
                TSCoatBuild(tsCoat: colorSplashSystem.coat2 as! TSCoat, viewColor: colorSplashSystem.viewColor)
            } else if (colorSplashSystem.coat2 is PACoat) {
                PACoatBuild(paCoat: colorSplashSystem.coat2 as! PACoat, viewColor: colorSplashSystem.viewColor)
            }
            else if (colorSplashSystem.coat2 is PUCoat) {
                PUCoatBuild(puCoat: colorSplashSystem.coat2 as! PUCoat, viewColor: colorSplashSystem.viewColor)
           }
            
            if (colorSplashSystem.coat3 is TSCoat) {
                TSCoatBuild(tsCoat: colorSplashSystem.coat3 as! TSCoat, viewColor: colorSplashSystem.viewColor)
            } else if (colorSplashSystem.coat3 is PACoat) {
                PACoatBuild(paCoat: colorSplashSystem.coat3 as! PACoat, viewColor: colorSplashSystem.viewColor)
            }
            else if (colorSplashSystem.coat3 is PUCoat) {
                PUCoatBuild(puCoat: colorSplashSystem.coat3 as! PUCoat, viewColor: colorSplashSystem.viewColor)
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
        .navigationTitle(colorSplashSystem.name)
        .sheet(isPresented: $isEditing) {
            SaveSystemView(system: colorSplashSystem)
        }
            
    }
}





struct ColorSplashBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorSplashSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorSplashBuildSuite(colorSplashSystem: mockSystem)
    }
}

