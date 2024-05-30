//
//  EpoxyMVRSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRSystemSuite: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    var body: some View {
        
        ScrollView {
            
            EpoxyMVRCoatOptions(epoxyMVRSystem: epoxyMVRSystem)
            EpoxyMVRSystemCommitButton(epoxyMVRSystem: epoxyMVRSystem)
            
        }
        .navigationTitle("Coat Options")
        
    }
    
}

struct EpoxyMVRSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRSystemSuite(epoxyMVRSystem: mockSystem)
    }
}
