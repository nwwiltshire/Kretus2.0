//
//  ColorChipSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/20/24.
//

import Foundation
import SwiftUI

struct ColorChipSystemSuite: View {
    
    @ObservedObject var colorChipSystem: ColorChipSystem
    
    var body: some View {
        
        VStack {
            
            ColorChipSubSystemPicker(colorChipSystem: colorChipSystem)
            
            // UPC Example:
            
            /*
            UPCCoatOptions(upcSystem: upcSystem)
            UPCSubSystemPicker(upcSystem: upcSystem)
            UPCColorPicker(upcSystem: upcSystem)
            UPCSystemCommitButton(upcSystem: upcSystem)
             */
            
            
            
        }
    }
}





struct ColorChipSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipSystemSuite(colorChipSystem: mockSystem)
    }
}
