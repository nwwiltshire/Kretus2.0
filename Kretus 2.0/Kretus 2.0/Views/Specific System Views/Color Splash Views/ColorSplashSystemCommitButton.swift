//
//  ColorSplashSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/28/24.
//

import Foundation
import SwiftUI

struct ColorSplashSystemCommitButton: View {
  
  @ObservedObject var colorSplashSystem: ColorSplashSystem
  
  var body: some View {
    NavigationLink(destination: ColorSplashCoatEditorView(colorSplashSystem: colorSplashSystem)
        .onAppear {
            
            switch colorSplashSystem.selectedSubType1 {
            case .ts:
                colorSplashSystem.coat1 = colorSplashSystem.createTSCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat1, solventCleaner: colorSplashSystem.solventCleaner, mattingAdditive: false, thickness: .base)
            case .pa:
                colorSplashSystem.coat1 = colorSplashSystem.createPACoat(squareFt: colorSplashSystem.squareFt, coatType: .coat1, solventCleaner: colorSplashSystem.solventCleaner, mattingAdditive: false, thickness: .base)
            case .pu:
                colorSplashSystem.coat1 = colorSplashSystem.createPUCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat1, solventCleaner: colorSplashSystem.solventCleaner, mattingAdditive: false, thickness: .base)
            case .upc:
                colorSplashSystem.coat1 = colorSplashSystem.createUPCCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat1, solventCleaner: colorSplashSystem.solventCleaner, thickness: .thinRC)
            }
            
            switch colorSplashSystem.selectedSubType2 {
            case .ts:
                colorSplashSystem.coat2 = colorSplashSystem.createTSCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat2, solventCleaner: false, mattingAdditive: colorSplashSystem.mattingAdditive2, thickness: .base)
            case .pa:
                colorSplashSystem.coat2 = colorSplashSystem.createPACoat(squareFt: colorSplashSystem.squareFt, coatType: .coat2, solventCleaner: false, mattingAdditive: colorSplashSystem.mattingAdditive2, thickness: .base)
            case .pu:
                colorSplashSystem.coat2 = colorSplashSystem.createPUCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat2, solventCleaner: false, mattingAdditive: colorSplashSystem.mattingAdditive2, thickness: .base)
            }
            
            switch colorSplashSystem.selectedSubType3 {
            case .ts:
                colorSplashSystem.coat3 = colorSplashSystem.createTSCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat3, solventCleaner: false, mattingAdditive: colorSplashSystem.mattingAdditive3, thickness: .base)
            case .pa:
                colorSplashSystem.coat3 = colorSplashSystem.createPACoat(squareFt: colorSplashSystem.squareFt, coatType: .coat3, solventCleaner: false, mattingAdditive: colorSplashSystem.mattingAdditive3, thickness: .base)
            case .pu:
                colorSplashSystem.coat3 = colorSplashSystem.createPUCoat(squareFt: colorSplashSystem.squareFt, coatType: .coat3, solventCleaner: false, mattingAdditive: colorSplashSystem.mattingAdditive3, thickness: .base)
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





struct ColorSplashSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorSplashSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorSplashSystemCommitButton(colorSplashSystem: mockSystem)
    }
}
