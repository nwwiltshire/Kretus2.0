//
//  ColorChipBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct ColorChipBuildSuite: View {
    
    @ObservedObject var colorChipSystem: ColorChipSystem
    
    @State private var showSheet = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        Text("Test")
    }
}





struct ColorChipBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipBuildSuite(colorChipSystem: mockSystem)
    }
}
