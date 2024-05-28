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
            
            // handle coat creation logic
            
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
