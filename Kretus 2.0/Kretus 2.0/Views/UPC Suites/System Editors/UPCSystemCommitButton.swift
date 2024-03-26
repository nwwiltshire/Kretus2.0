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
    NavigationLink(destination: CoatEditorView(upcSystem: upcSystem)) {
      HStack {
        Text("Coat Options")
          .font(.title)
          .padding()
        
        Spacer()
        
        Button(action: {
          // Creates base coat.
            self.upcSystem.baseCoat = upcSystem.createUPCCoat(squareFt: upcSystem.squareFt, coatType: .base, subType: upcSystem.subType)
        }) {
          Image(systemName: "chevron.right")
            .padding()
        }
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
