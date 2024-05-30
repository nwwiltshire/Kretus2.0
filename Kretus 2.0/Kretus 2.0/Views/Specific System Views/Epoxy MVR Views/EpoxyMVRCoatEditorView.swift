//
//  EpoxyMVRCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct EpoxyMVRCoatEditorView: View {
    
    @ObservedObject var epoxyMVRSystem: EpoxyMVRSystem
    
    var body: some View {
        
        ScrollView {
            
            TSCoatSuite(tsCoat: epoxyMVRSystem.mvrCoat)
            
            if (epoxyMVRSystem.primeCoat != nil) {
                TSCoatSuite(tsCoat: epoxyMVRSystem.primeCoat!)
            }
            
            EpoxyMVRBuildSubmitButton(epoxyMVRSystem: epoxyMVRSystem)
            
        }
        .padding()
        .navigationTitle("Coat Options")
        
    }
    
}

struct EpoxyMVRCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyMVRSystem()
        
        EpoxyMVRCoatEditorView(epoxyMVRSystem: mockSystem)
    }
}
