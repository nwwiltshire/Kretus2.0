//
//  EpoxyCoveCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct EpoxyCoveCoatEditorView: View {
    
    @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
    
    var body: some View {
        ScrollView {
            
            TSCoatSuite(tsCoat: epoxyCoveSystem.primeCoat)
            TSCoatSuite(tsCoat: epoxyCoveSystem.bodyCoat)
            TSCoatSuite(tsCoat: epoxyCoveSystem.capCoat)
            
            if (epoxyCoveSystem.broadcast != nil) {
                ColorChipBroadcastPicker(colorChipBroadcast: epoxyCoveSystem.broadcast!)
            }
            
            EpoxyCoveBuildSubmitButton(epoxyCoveSystem: epoxyCoveSystem)
            
        }
        .navigationTitle("Coat Options")
    }
}

struct EpoxyCoveCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyCoveSystem()
        
        EpoxyCoveCoatEditorView(epoxyCoveSystem: mockSystem)
    }
}
