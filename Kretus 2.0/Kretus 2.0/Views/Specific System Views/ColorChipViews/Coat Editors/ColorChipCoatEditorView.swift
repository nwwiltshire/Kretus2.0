//
//  ColorChipCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/21/24.
//

import Foundation
import SwiftUI

struct ColorChipCoatEditorView: View {
  
  @ObservedObject var colorChipSystem: ColorChipSystem
  
  var body: some View {
      ScrollView {
          Text("Modify the coats to your needs, and proceed to view your calculated System.")
              .font(.subheadline)
          
          if (colorChipSystem.baseCoat is TSCoat) {
              TSCoatSuite(tsCoat: colorChipSystem.baseCoat as! TSCoat)
          } else if (colorChipSystem.baseCoat is UPCCoat) {
              UPCUniversalCoatSuite(upcCoat: colorChipSystem.baseCoat as! UPCCoat)
          }
          
          if (colorChipSystem.primeCoat is TSCoat) {
              TSCoatSuite(tsCoat: colorChipSystem.primeCoat as! TSCoat)
          } else if (colorChipSystem.primeCoat is UPCCoat) {
              UPCUniversalCoatSuite(upcCoat: colorChipSystem.primeCoat as! UPCCoat)
          }
          
          if (colorChipSystem.mvrCoat is TSCoat) {
              TSCoatSuite(tsCoat: colorChipSystem.mvrCoat as! TSCoat)
          }
          
          Text("\(colorChipSystem.printSystemTest())")
          
      }
      .padding(.all)
      .navigationTitle("Coat Options")
  }
}

struct ColorChipCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipCoatEditorView(colorChipSystem: mockSystem)
    }
}
