//
//  EpoxyIndustrialSandSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI


struct EpoxyIndustrialSandSystemCommitButton: View {
  
    @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem

    var body: some View {
        NavigationLink(destination: EpoxyIndustrialSandCoatEditorView(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
            .onAppear {
                
                if (epoxyIndustrialSandSystem.subType != .db) {
                    epoxyIndustrialSandSystem.baseCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .base, mattingAdditive: false)
                    epoxyIndustrialSandSystem.broadcast = IndustrialSandBroadcast()
                    epoxyIndustrialSandSystem.broadcast!.squareFt = epoxyIndustrialSandSystem.squareFt
                    epoxyIndustrialSandSystem.broadcast!.sand = .twentyMesh
                } else {
                    epoxyIndustrialSandSystem.baseCoat1 = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .base1, mattingAdditive: false)
                    epoxyIndustrialSandSystem.baseCoat2 = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .base2, mattingAdditive: false)
                    
                    epoxyIndustrialSandSystem.broadcast1 = IndustrialSandBroadcast()
                    epoxyIndustrialSandSystem.broadcast2 = IndustrialSandBroadcast()
                    
                    epoxyIndustrialSandSystem.broadcast1!.squareFt = epoxyIndustrialSandSystem.squareFt
                    epoxyIndustrialSandSystem.broadcast1!.sand = .twentyMesh
                    
                    epoxyIndustrialSandSystem.broadcast2!.squareFt = epoxyIndustrialSandSystem.squareFt
                    epoxyIndustrialSandSystem.broadcast2!.sand = .twentyMesh
                }
                
                switch epoxyIndustrialSandSystem.capCoatSubType {
                case .ts:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive)
                case .polyaspartic:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createPACoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive)
                case .polyurethane:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createPUCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive)
                case .upcRCUV:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createUPCCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive)
                }
                
                switch epoxyIndustrialSandSystem.topCoatSubType {
                case .ts:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive)
                case .polyaspartic:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createPACoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive)
                case .polyurethane:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createPUCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive)
                case .upcRCUV:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createUPCCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive)
                }
                
                if (epoxyIndustrialSandSystem.primeCoat != nil) {
                    epoxyIndustrialSandSystem.primeCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .prime, mattingAdditive: false)
                }
                
                if (epoxyIndustrialSandSystem.mvrCoat != nil) {
                    epoxyIndustrialSandSystem.mvrCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .mvr, mattingAdditive: false)
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

struct EpoxyIndustrialSandSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyIndustrialSandSystem()

        EpoxyIndustrialSandSystemCommitButton(epoxyIndustrialSandSystem: mockSystem)
    }
}
