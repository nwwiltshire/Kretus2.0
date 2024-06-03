//
//  UPCColorQuartzSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct UPCColorQuartzSystemCommitButton: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    var body: some View {
        NavigationLink(destination: UPCColorQuartzCoatEditorView(upcColorQuartzSystem: upcColorQuartzSystem)
            .onAppear {
                
                switch upcColorQuartzSystem.subType {
                case .rc:
                    upcColorQuartzSystem.baseCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .base, subType: upcColorQuartzSystem.subType, thickness: upcColorQuartzSystem.thickness)
                case .tt:
                    upcColorQuartzSystem.baseCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .base, subType: upcColorQuartzSystem.subType, thickness: upcColorQuartzSystem.thickness)
                case .sl:
                    upcColorQuartzSystem.baseCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .base, subType: upcColorQuartzSystem.subType, thickness: upcColorQuartzSystem.thickness)
                case .mf:
                    upcColorQuartzSystem.baseCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .base, subType: upcColorQuartzSystem.subType, thickness: upcColorQuartzSystem.thickness)
                }
                
                switch upcColorQuartzSystem.capCoatSubType {
                case .ts:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createTSCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: upcColorQuartzSystem.capMattingAdditive)
                case .polyaspartic:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createPACoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: upcColorQuartzSystem.capMattingAdditive)
                case .polyurethane:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createPUCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: upcColorQuartzSystem.capMattingAdditive)
                }
                
                switch upcColorQuartzSystem.topCoatSubType {
                case .ts:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createTSCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: upcColorQuartzSystem.capMattingAdditive)
                case .polyaspartic:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createPACoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: upcColorQuartzSystem.capMattingAdditive)
                case .polyurethane:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createPUCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: upcColorQuartzSystem.capMattingAdditive)
                }
                
                if (upcColorQuartzSystem.primeCoat != nil) {
                    upcColorQuartzSystem.primeCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .prime, subType: upcColorQuartzSystem.subType, thickness: upcColorQuartzSystem.thickness)
                }
                
                if (upcColorQuartzSystem.mvrCoat != nil) {
                    upcColorQuartzSystem.mvrCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .prime, subType: upcColorQuartzSystem.subType, thickness: upcColorQuartzSystem.thickness)
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

struct UPCColorQuartzSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCColorQuartzSystem()
        
        UPCColorQuartzSystemCommitButton(upcColorQuartzSystem: mockSystem)
    }
}
