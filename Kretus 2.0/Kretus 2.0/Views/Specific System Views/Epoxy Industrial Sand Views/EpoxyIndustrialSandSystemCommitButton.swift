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
                    epoxyIndustrialSandSystem.baseCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .base, mattingAdditive: false, thickness: .base)
                    epoxyIndustrialSandSystem.baseCoat1 = nil
                    epoxyIndustrialSandSystem.baseCoat2 = nil
                    
                    epoxyIndustrialSandSystem.broadcast = IndustrialSandBroadcast()
                    epoxyIndustrialSandSystem.broadcast!.squareFt = epoxyIndustrialSandSystem.squareFt
                    epoxyIndustrialSandSystem.broadcast!.sand = .twentyMesh
                    epoxyIndustrialSandSystem.broadcast1 = nil
                    epoxyIndustrialSandSystem.broadcast2 = nil
                } else {
                    epoxyIndustrialSandSystem.baseCoat1 = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .base1, mattingAdditive: false, thickness: .base)
                    epoxyIndustrialSandSystem.baseCoat2 = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .base2, mattingAdditive: false, thickness: .base)
                    epoxyIndustrialSandSystem.baseCoat = nil
                    
                    epoxyIndustrialSandSystem.broadcast1 = IndustrialSandBroadcast()
                    epoxyIndustrialSandSystem.broadcast2 = IndustrialSandBroadcast()
                    epoxyIndustrialSandSystem.broadcast = nil
                    
                    epoxyIndustrialSandSystem.broadcast1!.squareFt = epoxyIndustrialSandSystem.squareFt
                    
                    epoxyIndustrialSandSystem.broadcast2!.squareFt = epoxyIndustrialSandSystem.squareFt
                }
                
                switch epoxyIndustrialSandSystem.capCoatSubType {
                case .ts:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive, thickness: .base)
                case .polyaspartic:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createPACoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive, thickness: .base)
                case .polyurethane:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createPUCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive, thickness: .base)
                case .upcRCUV:
                    epoxyIndustrialSandSystem.capCoat = epoxyIndustrialSandSystem.createUPCCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: epoxyIndustrialSandSystem.capMattingAdditive, thickness: .thinRC)
                }
                
                switch epoxyIndustrialSandSystem.topCoatSubType {
                case .ts:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive, thickness: .base)
                case .polyaspartic:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createPACoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive, thickness: .base)
                case .polyurethane:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createPUCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive, thickness: .base)
                case .upcRCUV:
                    epoxyIndustrialSandSystem.topCoat = epoxyIndustrialSandSystem.createUPCCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: epoxyIndustrialSandSystem.topMattingAdditive, thickness: .thinRC)
                }
                
                if (epoxyIndustrialSandSystem.primeCoat != nil) {
                    epoxyIndustrialSandSystem.primeCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .prime, mattingAdditive: false, thickness: .prime)
                }
                
                if (epoxyIndustrialSandSystem.mvrCoat != nil) {
                    epoxyIndustrialSandSystem.mvrCoat = epoxyIndustrialSandSystem.createTSCoat(squareFt: epoxyIndustrialSandSystem.squareFt, coatType: .mvr, mattingAdditive: false, thickness: .mvr)
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
