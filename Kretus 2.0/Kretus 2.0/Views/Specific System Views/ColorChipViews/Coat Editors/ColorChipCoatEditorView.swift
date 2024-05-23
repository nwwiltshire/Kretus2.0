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
          } else if (colorChipSystem.baseCoat is PACoat) {
              PACoatSuite(paCoat: colorChipSystem.baseCoat as! PACoat)
          }
          
          if (colorChipSystem.primeCoat is TSCoat) {
              TSCoatSuite(tsCoat: colorChipSystem.primeCoat as! TSCoat)
          } else if (colorChipSystem.primeCoat is UPCCoat) {
              UPCUniversalCoatSuite(upcCoat: colorChipSystem.primeCoat as! UPCCoat)
          } else if (colorChipSystem.primeCoat is PACoat){
              PACoatSuite(paCoat: colorChipSystem.primeCoat as! PACoat)
          }
          
          if (colorChipSystem.mvrCoat is TSCoat) {
              TSCoatSuite(tsCoat: colorChipSystem.mvrCoat as! TSCoat)
          }
          
          PACoatSuite(paCoat: colorChipSystem.topCoat1)
          
          if (colorChipSystem.topCoat2 is PACoat) {
              PACoatSuite(paCoat: colorChipSystem.topCoat2 as! PACoat)
          }
          
          if (colorChipSystem.topCoat2 is PUCoat) {
              PUCoatSuite(puCoat: colorChipSystem.topCoat2 as! PUCoat)
          }

          
          
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
