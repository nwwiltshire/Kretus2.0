//
//  UPCCoveSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct UPCCoveSystemCommitButton: View {
    
    @ObservedObject var upcCoveSystem: UPCCoveSystem
    
    var body: some View {
        NavigationLink(destination: UPCCoveCoatEditorView(upcCoveSystem: upcCoveSystem)
            .onAppear {
                
                upcCoveSystem.primeCoat = upcCoveSystem.createUPCCoat(squareFt: upcCoveSystem.squareFt, coatType: .prime, subType: .rc, coveHeight: upcCoveSystem.height)
                
                upcCoveSystem.bodyCoat = upcCoveSystem.createUPCCoat(squareFt: upcCoveSystem.squareFt, coatType: .body, subType: .wcvc, coveHeight: upcCoveSystem.height)
                
                upcCoveSystem.capCoat = upcCoveSystem.createUPCCoat(squareFt: upcCoveSystem.squareFt, coatType: .cap, subType: .rc, coveHeight: upcCoveSystem.height)
                
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

struct UPCCoveSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCCoveSystem()
        
        UPCCoveSystemCommitButton(upcCoveSystem: mockSystem)
    }
}
