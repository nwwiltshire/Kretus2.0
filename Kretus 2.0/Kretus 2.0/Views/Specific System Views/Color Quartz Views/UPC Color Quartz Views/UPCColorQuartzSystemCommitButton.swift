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
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createTSCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: upcColorQuartzSystem.capMattingAdditive, thickness: .base)
                case .polyaspartic:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createPACoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: upcColorQuartzSystem.capMattingAdditive, thickness: .base)
                case .polyurethane:
                    upcColorQuartzSystem.capCoat = upcColorQuartzSystem.createPUCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: upcColorQuartzSystem.capMattingAdditive, thickness: .base)
                }
                
                switch upcColorQuartzSystem.topCoatSubType {
                case .ts:
                    upcColorQuartzSystem.topCoat = upcColorQuartzSystem.createTSCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: upcColorQuartzSystem.capMattingAdditive, thickness: .base)
                case .polyaspartic:
                    upcColorQuartzSystem.topCoat = upcColorQuartzSystem.createPACoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: upcColorQuartzSystem.capMattingAdditive, thickness: .base)
                case .polyurethane:
                    upcColorQuartzSystem.topCoat = upcColorQuartzSystem.createPUCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: upcColorQuartzSystem.capMattingAdditive, thickness: .base)
                }
                
                if (upcColorQuartzSystem.primeCoat != nil) {
                    upcColorQuartzSystem.primeCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .prime, subType: upcColorQuartzSystem.subType, thickness: .prime)
                }
                
                if (upcColorQuartzSystem.mvrCoat != nil) {
                    upcColorQuartzSystem.mvrCoat = upcColorQuartzSystem.createUPCCoat(squareFt: upcColorQuartzSystem.squareFt, coatType: .mvr, subType: upcColorQuartzSystem.subType, thickness: .thinRC)
                }
                
                upcColorQuartzSystem.broadcast.squareFt = upcColorQuartzSystem.squareFt
                upcColorQuartzSystem.broadcast.grade = .q
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
