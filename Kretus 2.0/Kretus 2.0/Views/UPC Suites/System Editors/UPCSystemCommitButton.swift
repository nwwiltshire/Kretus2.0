//
//  SystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/15/24.
//

import Foundation
import SwiftUI

struct UPCSystemCommitButton: View {
  
  @ObservedObject var upcSystem: UPCSystem
  
  var body: some View {
    NavigationLink(destination: CoatEditorView(upcSystem: upcSystem)
        // Creates base coat
        .onAppear {
            upcSystem.baseCoat = upcSystem.createUPCCoat(squareFt: upcSystem.squareFt, coatType: .base, subType: upcSystem.subType)
            if ((upcSystem.primeCoat) != nil) {
                upcSystem.primeCoat = upcSystem.createUPCCoat(squareFt: upcSystem.squareFt, coatType: .prime, subType: upcSystem.subType)
            }
            if ((upcSystem.topCoat) != nil) {
                upcSystem.topCoat = upcSystem.createUPCCoat(squareFt: upcSystem.squareFt, coatType: .top, subType: upcSystem.subType)
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





struct UPCSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCSystemCommitButton(upcSystem: mockSystem)
    }
}
