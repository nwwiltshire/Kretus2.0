//
//  EpoxyMVRSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRSystemCommitButton: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    var body: some View {
        
        NavigationLink(destination: EpoxyMVRCoatEditorView(epoxyMVRSystem: epoxyMVRSystem)
            .onAppear {
                
                epoxyMVRSystem.mvrCoat = epoxyMVRSystem.createTSCoat(squareFt: epoxyMVRSystem.squareFt, coatType: .mvr, thickness: epoxyMVRSystem.thickness)
                
                if (epoxyMVRSystem.hasPrimeCoat) {
                    epoxyMVRSystem.primeCoat = epoxyMVRSystem.createTSCoat(squareFt: epoxyMVRSystem.squareFt, coatType: .prime, thickness: .mvrPrime)
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

struct EpoxyMVRSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRSystemCommitButton(epoxyMVRSystem: mockSystem)
    }
}
