//
//  hasCoatPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/8/24.
//

import Foundation
import SwiftUI


struct UPCCoatOptions: View {
  
  @State var upcSystem: UPCSystemData
  
  var body: some View {
    VStack {
      Text("Base Coat (Always Applied)")
      
      Toggle(isOn: Binding(
        get: { self.upcSystem.primeCoat != nil },
        set: { newValue in
          if !newValue {
            self.upcSystem.primeCoat = nil
          } else {
            self.upcSystem.primeCoat = self.upcSystem.createUPCCoat(squareFt: upcSystem.squareFt)
          }
        }
      )) {
        Text("Prime Coat")
      }
      
      Toggle(isOn: Binding(
        get: { self.upcSystem.topCoat != nil },
        set: { newValue in
          if !newValue {
            self.upcSystem.topCoat = nil
          } else {
            self.upcSystem.topCoat = self.upcSystem.createUPCCoat(squareFt: upcSystem.squareFt)
          }
        }
      )) {
        Text("Top Coat")
      }
      
      Toggle(isOn: $upcSystem.uvResistance) {
        HStack {
          Image(systemName: "plus.circle")
          Text("UV Resistance")
        }
      }
      .foregroundColor(self.upcSystem.topCoat == nil ? .gray : .primary)
      .disabled(self.upcSystem.topCoat == nil)
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 10)
        .fill(Color(upcSystem.viewColor).opacity(0.25))
    )
  }
}






struct UPCCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystemData()

        // Pass the mock System instance into SystemBuilderView
        UPCCoatOptions(upcSystem: mockSystem)
    }
}

