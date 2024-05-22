//
//  ColorChipSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/21/24.
//

import Foundation
import SwiftUI

struct ColorChipSystemCommitButton: View {
  
  @ObservedObject var colorChipSystem: ColorChipSystem
  
  var body: some View {
    NavigationLink(destination: ColorChipCoatEditorView(colorChipSystem: colorChipSystem)
        // Creates base coat
        .onAppear {
            if (colorChipSystem.subType == .rc) {
                
                colorChipSystem.baseCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .base, subType: .rc, uvResistance: false)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, subType: .rc, uvResistance: false)
                }
                
            } else if (colorChipSystem.subType == .rcuv) {
                
                colorChipSystem.baseCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .base, subType: .rc, uvResistance: true)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, subType: .rc, uvResistance: true)
                }
                
            } else if (colorChipSystem.subType == .ts) {
                
                colorChipSystem.baseCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .base)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .prime)
                }
                if ((colorChipSystem.mvrCoat) != nil) {
                    colorChipSystem.mvrCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .mvr)
                }
                
            } else if (colorChipSystem.subType == .sl) {
                
                colorChipSystem.baseCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .base, subType: .sl, uvResistance: false)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, subType: .sl, uvResistance: false)
                }
                
            } else {
                colorChipSystem.baseCoat = colorChipSystem.createPACoat(squareFt: colorChipSystem.squareFt, coatType: .base)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createPACoat(squareFt: colorChipSystem.squareFt, coatType: .prime)
                }
                if ((colorChipSystem.mvrCoat) != nil) {
                    colorChipSystem.mvrCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .mvr)
                }
            }
        }) {
      HStack {
        Text("Coat Options")
          .font(.title)
          .padding()
        
        Spacer()
          
        Image(systemName: "chevron.right")
              .padding()
      }
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(10)
    
    }
  }
}





struct ColorChipSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipSystemCommitButton(colorChipSystem: mockSystem)
    }
}
