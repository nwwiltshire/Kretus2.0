//
//  MetallicSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

struct MetallicSystemCommitButton: View {
    
    @ObservedObject var metallicSystem: MetallicSystem
    
    var body: some View {
      NavigationLink(destination: MetallicCoatEditorView(metallicSystem: metallicSystem)
          .onAppear {
              
              if (metallicSystem.subType == .metallic) {
                  metallicSystem.metallicBaseCoat = metallicSystem.createTSCoat(squareFt: metallicSystem.squareFt, coatType: .metallicBase, mattingAdditive: false, solventCleaner: false)
                  
                  metallicSystem.metallicAccentCoat = metallicSystem.createTSCoat(squareFt: metallicSystem.squareFt, coatType: .metallicAccent, mattingAdditive: false, solventCleaner: false)
                  
                  metallicSystem.metallicBodyCoat = nil
              } else {
                  metallicSystem.metallicBodyCoat = metallicSystem.createPUCoat(squareFt: metallicSystem.squareFt, coatType: .metallicBody, mattingAdditive: false)
                  
                  metallicSystem.metallicBaseCoat = nil
                  metallicSystem.metallicAccentCoat = nil
              }
              
              metallicSystem.primeCoat = metallicSystem.createTSCoat(squareFt: metallicSystem.squareFt, coatType: .prime, mattingAdditive: false, solventCleaner: metallicSystem.primeSolventCleaner)
              
              switch metallicSystem.topCoatSubType {
              case .ts:
                  metallicSystem.topCoat = metallicSystem.createTSCoat(squareFt: metallicSystem.squareFt, coatType: .metallicTop, mattingAdditive: metallicSystem.topMattingAdditive, solventCleaner: false)
              case .pa:
                  metallicSystem.topCoat = metallicSystem.createPACoat(squareFt: metallicSystem.squareFt, coatType: .top, mattingAdditive: metallicSystem.topMattingAdditive)
              case .pu:
                  metallicSystem.topCoat = metallicSystem.createPUCoat(squareFt: metallicSystem.squareFt, coatType: .top, mattingAdditive: metallicSystem.topMattingAdditive)
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
struct MetallicSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = MetallicSystem()
        
        MetallicSystemCommitButton(metallicSystem: mockSystem)
    }
}
