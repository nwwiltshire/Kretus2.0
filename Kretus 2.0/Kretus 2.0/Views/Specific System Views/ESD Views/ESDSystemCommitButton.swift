//
//  ESDSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ESDSystemCommitButton: View {
    
    @ObservedObject var esdSystem: ESDSystem
        
    var body: some View {
      NavigationLink(destination: ESDCoatEditorView(esdSystem: esdSystem)
          .onAppear {
              
              esdSystem.mvrCoat = esdSystem.createTSCoat(squareFt: esdSystem.squareFt, coatType: .mvr, thickness: .base)
              
              esdSystem.topCoat = esdSystem.createPACoat(squareFt: esdSystem.squareFt, coatType: .top, thickness: .base)
              
              if (esdSystem.subType == .conductive) {
                  esdSystem.conductivePrimer = esdSystem.createCP(squareFt: esdSystem.squareFt)
              } else {
                  esdSystem.conductivePrimer = nil
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

struct ESDSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ESDSystem()
        
        ESDSystemCommitButton(esdSystem: mockSystem)
    }
}
