//
//  EpoxyCoveSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct EpoxyCoveSystemCommitButton: View {
    
    @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
    
    var body: some View {
        NavigationLink(destination: EpoxyCoveCoatEditorView(epoxyCoveSystem: epoxyCoveSystem)
            .onAppear {
                
                epoxyCoveSystem.primeCoat = epoxyCoveSystem.createTSCoat(squareFt: epoxyCoveSystem.squareFt, coatType: .prime, subType: epoxyCoveSystem.subType, selectedPartA: .coveResin, coveHeight: epoxyCoveSystem.height)
                
                epoxyCoveSystem.bodyCoat = epoxyCoveSystem.createTSCoat(squareFt: epoxyCoveSystem.squareFt, coatType: .body, subType: epoxyCoveSystem.subType, selectedPartA: .coveResin, coveHeight: epoxyCoveSystem.height)
                
                epoxyCoveSystem.capCoat = epoxyCoveSystem.createTSCoat(squareFt: epoxyCoveSystem.squareFt, coatType: .cap, subType: epoxyCoveSystem.subType, selectedPartA: .coveResin, coveHeight: epoxyCoveSystem.height)
                
                if (epoxyCoveSystem.subType == .ecColorChip) {
                    epoxyCoveSystem.broadcast = ColorChipBroadcast()
                    epoxyCoveSystem.broadcast?.squareFt = epoxyCoveSystem.squareFt
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

struct EpoxyCoveSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyCoveSystem()
        
        EpoxyCoveSystemCommitButton(epoxyCoveSystem: mockSystem)
    }
}
