//
//  ColorSplashCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/28/24.
//

import Foundation
import SwiftUI

struct ColorSplashCoatEditorView: View {
    
    @ObservedObject var colorSplashSystem: ColorSplashSystem
    
    var body: some View {
        
        ScrollView {
            
            if (colorSplashSystem.coat1 is TSCoat) {
                TSCoatSuite(tsCoat: colorSplashSystem.coat1 as! TSCoat)
            } else if (colorSplashSystem.coat1 is PACoat) {
                PACoatSuite(paCoat: colorSplashSystem.coat1 as! PACoat)
            }
            else if (colorSplashSystem.coat1 is PUCoat) {
                PUCoatSuite(puCoat: colorSplashSystem.coat1 as! PUCoat)
           }
            else if (colorSplashSystem.coat1 is UPCCoat) {
                UPCUniversalCoatSuite(upcCoat: colorSplashSystem.coat1 as! UPCCoat)
           }
            
            
            if (colorSplashSystem.coat2 is TSCoat) {
                TSCoatSuite(tsCoat: colorSplashSystem.coat2 as! TSCoat)
            } else if (colorSplashSystem.coat2 is PACoat) {
                PACoatSuite(paCoat: colorSplashSystem.coat2 as! PACoat)
            }
            else if (colorSplashSystem.coat2 is PUCoat) {
                PUCoatSuite(puCoat: colorSplashSystem.coat2 as! PUCoat)
           }
            
            if (colorSplashSystem.coat3 is TSCoat) {
                TSCoatSuite(tsCoat: colorSplashSystem.coat3 as! TSCoat)
            } else if (colorSplashSystem.coat1 is PACoat) {
                PACoatSuite(paCoat: colorSplashSystem.coat3 as! PACoat)
            }
            else if (colorSplashSystem.coat1 is PUCoat) {
                PUCoatSuite(puCoat: colorSplashSystem.coat3 as! PUCoat)
           }
            
            ColorSplashBuildSubmitButton(colorSplashSystem: colorSplashSystem)
            
        }
        
    }
}





struct ColorSplashCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorSplashSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorSplashCoatEditorView(colorSplashSystem: mockSystem)
    }
}
