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
        .onAppear {
            if (colorChipSystem.subType == .rc) {
                
                colorChipSystem.baseCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .base, subType: .rc, uvResistance: false, thickness: .thinRC)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, subType: .rc, uvResistance: false, thickness: .thinRC)
                }
                
            } else if (colorChipSystem.subType == .rcuv) {
                
                colorChipSystem.baseCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .base, subType: .rc, uvResistance: true, thickness: .thinRC)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, subType: .rc, uvResistance: true, thickness: .thinRC)
                }
                
            } else if (colorChipSystem.subType == .ts) {
                
                colorChipSystem.baseCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .base, thickness: .base)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, thickness: .prime)
                }
                if ((colorChipSystem.mvrCoat) != nil) {
                    colorChipSystem.mvrCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .mvr, thickness: .mvr)
                }
                
            } else if (colorChipSystem.subType == .sl) {
                
                colorChipSystem.baseCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .base, subType: .sl, uvResistance: false, thickness: .thin)
                
                if (colorChipSystem.primeCoat != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createUPCCoat(squareFt: colorChipSystem.squareFt, coatType: .prime, subType: .sl, uvResistance: false, thickness: .thin)
                }
                
            } else if (colorChipSystem.subType == .pa){
                colorChipSystem.baseCoat = colorChipSystem.createPACoat(squareFt: colorChipSystem.squareFt, coatType: .base, thickness: .base)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    colorChipSystem.primeCoat = colorChipSystem.createPACoat(squareFt: colorChipSystem.squareFt, coatType: .prime, thickness: .prime)
                }
                if ((colorChipSystem.mvrCoat) != nil) {
                    colorChipSystem.mvrCoat = colorChipSystem.createTSCoat(squareFt: colorChipSystem.squareFt, coatType: .mvr, thickness: .mvr)
                }
            }
            
            colorChipSystem.topCoat1 = colorChipSystem.createPACoat(squareFt: colorChipSystem.squareFt, coatType: .top1, thickness: .top1)
            
            if (colorChipSystem.topCoat2 != nil) {
                switch colorChipSystem.topCoat2SubType {
                case .polyaspartic:
                    colorChipSystem.topCoat2 = colorChipSystem.createPACoat(squareFt: colorChipSystem.squareFt, coatType: .top2, thickness: .top2)
                case .polyurethane:
                    colorChipSystem.topCoat2 = colorChipSystem.createPUCoat(squareFt: colorChipSystem.squareFt, coatType: .top2, thickness: .top2)
                }
            }
            
            colorChipSystem.broadcast.squareFt = colorChipSystem.squareFt
            
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
