//
//  ColorSplashSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/28/24.
//

import Foundation
import SwiftUI

struct ColorSplashSystemSuite: View {
    
    @ObservedObject var colorSplashSystem: ColorSplashSystem
    
    var body: some View {
        VStack {
            ColorSplashCoatOptions(colorSplashSystem: colorSplashSystem)
            ColorSplashSystemCommitButton(colorSplashSystem: colorSplashSystem)
        }
    }
}





struct ColorSplashSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorSplashSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorSplashSystemSuite(colorSplashSystem: mockSystem)
    }
}
