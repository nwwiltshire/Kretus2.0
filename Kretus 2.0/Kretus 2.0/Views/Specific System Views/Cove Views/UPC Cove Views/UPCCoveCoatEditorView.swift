//
//  EpoxyCoveCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct UPCCoveCoatEditorView: View {
    
    @ObservedObject var upcCoveSystem: UPCCoveSystem
    
    var body: some View {
        ScrollView {
            
            UPCUniversalCoatSuite(upcCoat: upcCoveSystem.primeCoat)
            UPCUniversalCoatSuite(upcCoat: upcCoveSystem.bodyCoat)
            UPCUniversalCoatSuite(upcCoat: upcCoveSystem.capCoat)
            
            
            UPCCoveBuildSubmitButton(upcCoveSystem: upcCoveSystem)
            
        }
        .padding()
        .navigationTitle("Coat Options")
    }
}

struct UPCCoveCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCCoveSystem()
        
        UPCCoveCoatEditorView(upcCoveSystem: mockSystem)
    }
}
