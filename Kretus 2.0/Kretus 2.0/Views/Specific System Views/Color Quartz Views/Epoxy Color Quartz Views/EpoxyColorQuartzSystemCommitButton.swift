//
//  EpoxyColorQuartzSystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct EpoxyColorQuartzSystemCommitButton: View {
    
    @ObservedObject var epoxyColorQuartzSystem: EpoxyColorQuartzSystem
    
    var body: some View {
        NavigationLink(destination: EpoxyColorQuartzCoatEditorView(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
            .onAppear {
                
                if (epoxyColorQuartzSystem.subType != .db) {
                    epoxyColorQuartzSystem.baseCoat = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .base, mattingAdditive: false)
                    epoxyColorQuartzSystem.broadcast = ColorChipBroadcast()
                    epoxyColorQuartzSystem.broadcast!.squareFt = epoxyColorQuartzSystem.squareFt
                    epoxyColorQuartzSystem.broadcast!.grade = .q
                } else {
                    epoxyColorQuartzSystem.baseCoat1 = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .base1, mattingAdditive: false)
                    epoxyColorQuartzSystem.baseCoat2 = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .base2, mattingAdditive: false)
                    
                    epoxyColorQuartzSystem.broadcast1 = ColorChipBroadcast()
                    epoxyColorQuartzSystem.broadcast2 = ColorChipBroadcast()
                    
                    epoxyColorQuartzSystem.broadcast1!.squareFt = epoxyColorQuartzSystem.squareFt
                    epoxyColorQuartzSystem.broadcast1!.grade = .q
                    
                    epoxyColorQuartzSystem.broadcast2!.squareFt = epoxyColorQuartzSystem.squareFt
                    epoxyColorQuartzSystem.broadcast2!.grade = .q
                }
                
                switch epoxyColorQuartzSystem.capCoatSubType {
                case .ts:
                    epoxyColorQuartzSystem.capCoat = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: epoxyColorQuartzSystem.capMattingAdditive)
                case .polyaspartic:
                    epoxyColorQuartzSystem.capCoat = epoxyColorQuartzSystem.createPACoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: epoxyColorQuartzSystem.capMattingAdditive)
                case .polyurethane:
                    epoxyColorQuartzSystem.capCoat = epoxyColorQuartzSystem.createPUCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .cap, mattingAdditive: epoxyColorQuartzSystem.capMattingAdditive)
                }
                
                switch epoxyColorQuartzSystem.topCoatSubType {
                case .ts:
                    epoxyColorQuartzSystem.topCoat = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: epoxyColorQuartzSystem.capMattingAdditive)
                case .polyaspartic:
                    epoxyColorQuartzSystem.topCoat = epoxyColorQuartzSystem.createPACoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: epoxyColorQuartzSystem.capMattingAdditive)
                case .polyurethane:
                    epoxyColorQuartzSystem.topCoat = epoxyColorQuartzSystem.createPUCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .top, mattingAdditive: epoxyColorQuartzSystem.capMattingAdditive)
                }
                
                if (epoxyColorQuartzSystem.primeCoat != nil) {
                    epoxyColorQuartzSystem.primeCoat = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .prime, mattingAdditive: false)
                }
                
                if (epoxyColorQuartzSystem.mvrCoat != nil) {
                    epoxyColorQuartzSystem.mvrCoat = epoxyColorQuartzSystem.createTSCoat(squareFt: epoxyColorQuartzSystem.squareFt, coatType: .mvr, mattingAdditive: false)
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

struct EpoxyColorQuartzSystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyColorQuartzSystem()
        
        EpoxyColorQuartzSystemCommitButton(epoxyColorQuartzSystem: mockSystem)
    }
}
