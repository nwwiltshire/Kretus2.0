//
//  EpoxyMVRCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRCoatOptions: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    var body: some View {
        
        HStack {
            Toggle(isOn: $epoxyMVRSystem.hasPrimeCoat) {
                Text("Prime Coat")
            }
        }
    .padding()
    .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(epoxyMVRSystem.viewColor).opacity(0.25))
        )
        
    }
    
}

struct EpoxyMVRCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRCoatOptions(epoxyMVRSystem: mockSystem)
    }
}
