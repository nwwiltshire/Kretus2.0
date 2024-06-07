//
//  UPCIndustrialSandSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI


struct UPCIndustrialSandSystemCommitButton: View {
  
    @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem

    var body: some View {
        NavigationLink(destination: UPCIndustrialSandCoatEditorView(upcIndustrialSandSystem: upcIndustrialSandSystem)
            .onAppear {
                
                if (upcIndustrialSandSystem.subType != .dbrc) {
                    upcIndustrialSandSystem.baseCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .base, mattingAdditive: false, isUV: false)
                    upcIndustrialSandSystem.broadcast = IndustrialSandBroadcast()
                    upcIndustrialSandSystem.broadcast!.squareFt = upcIndustrialSandSystem.squareFt
                    upcIndustrialSandSystem.broadcast!.sand = .twentyMesh
                } else {
                    upcIndustrialSandSystem.baseCoat1 = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .base1, mattingAdditive: false, isUV: false)
                    upcIndustrialSandSystem.baseCoat2 = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .base2, mattingAdditive: false, isUV: false)
                    
                    upcIndustrialSandSystem.broadcast1 = IndustrialSandBroadcast()
                    upcIndustrialSandSystem.broadcast2 = IndustrialSandBroadcast()
                    
                    upcIndustrialSandSystem.broadcast1!.squareFt = upcIndustrialSandSystem.squareFt
                    upcIndustrialSandSystem.broadcast1!.sand = .twentyMesh
                    
                    upcIndustrialSandSystem.broadcast2!.squareFt = upcIndustrialSandSystem.squareFt
                    upcIndustrialSandSystem.broadcast2!.sand = .twentyMesh
                }
                
                switch upcIndustrialSandSystem.capCoatSubType {
                case .ts:
                    upcIndustrialSandSystem.capCoat = upcIndustrialSandSystem.createTSCoat(squareFt: upcIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: upcIndustrialSandSystem.capMattingAdditive)
                case .polyaspartic:
                    upcIndustrialSandSystem.capCoat = upcIndustrialSandSystem.createPACoat(squareFt: upcIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: upcIndustrialSandSystem.capMattingAdditive)
                case .polyurethane:
                    upcIndustrialSandSystem.capCoat = upcIndustrialSandSystem.createPUCoat(squareFt: upcIndustrialSandSystem.squareFt, coatType: .cap, mattingAdditive: upcIndustrialSandSystem.capMattingAdditive)
                case .upc:
                    upcIndustrialSandSystem.capCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .cap, mattingAdditive: false, isUV: false)
                case .upcRCUV:
                    upcIndustrialSandSystem.capCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .cap, mattingAdditive: false, isUV: true)
                }
                
                switch upcIndustrialSandSystem.topCoatSubType {
                case .ts:
                    upcIndustrialSandSystem.topCoat = upcIndustrialSandSystem.createTSCoat(squareFt: upcIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: upcIndustrialSandSystem.topMattingAdditive)
                case .polyaspartic:
                    upcIndustrialSandSystem.topCoat = upcIndustrialSandSystem.createPACoat(squareFt: upcIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: upcIndustrialSandSystem.topMattingAdditive)
                case .polyurethane:
                    upcIndustrialSandSystem.topCoat = upcIndustrialSandSystem.createPUCoat(squareFt: upcIndustrialSandSystem.squareFt, coatType: .top, mattingAdditive: upcIndustrialSandSystem.topMattingAdditive)
                case .upc:
                    upcIndustrialSandSystem.topCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .top, mattingAdditive: upcIndustrialSandSystem.topMattingAdditive, isUV: false)
                case .upcRCUV:
                    upcIndustrialSandSystem.topCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: upcIndustrialSandSystem.subType, coatType: .top, mattingAdditive: upcIndustrialSandSystem.topMattingAdditive, isUV: true)
                }
                
                if (upcIndustrialSandSystem.primeCoat != nil) {
                    upcIndustrialSandSystem.primeCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: .rc, coatType: .prime, mattingAdditive: false, isUV: false)
                }
                
                if (upcIndustrialSandSystem.mvrCoat != nil) {
                    upcIndustrialSandSystem.mvrCoat = upcIndustrialSandSystem.createUPCCoat(squareFt: upcIndustrialSandSystem.squareFt, subType: .rc, coatType: .prime, mattingAdditive: false, isUV: false)
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

struct UPCIndustrialSandSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCIndustrialSandSystem()

        UPCIndustrialSandSystemCommitButton(upcIndustrialSandSystem: mockSystem)
    }
}
