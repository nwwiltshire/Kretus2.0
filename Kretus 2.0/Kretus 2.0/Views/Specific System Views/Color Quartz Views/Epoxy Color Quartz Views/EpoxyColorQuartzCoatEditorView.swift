//
//  EpoxyColorQuartzCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct EpoxyColorQuartzCoatEditorView: View {
    
    @ObservedObject var epoxyColorQuartzSystem: EpoxyColorQuartzSystem
    
    var body: some View {
        ScrollView {
            
            if (epoxyColorQuartzSystem.baseCoat != nil) {
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.baseCoat!)
                ColorChipBroadcastPicker(colorChipBroadcast: epoxyColorQuartzSystem.broadcast!)
            }
            
            if (epoxyColorQuartzSystem.baseCoat1 != nil) {
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.baseCoat1!)
                ColorChipBroadcastPicker(colorChipBroadcast: epoxyColorQuartzSystem.broadcast1!)
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.baseCoat2!)
                ColorChipBroadcastPicker(colorChipBroadcast: epoxyColorQuartzSystem.broadcast2!)
            }
            
            if (epoxyColorQuartzSystem.capCoat is TSCoat) {
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.capCoat as! TSCoat)
            } else if (epoxyColorQuartzSystem.capCoat is PACoat) {
                PACoatSuite(paCoat: epoxyColorQuartzSystem.capCoat as! PACoat)
            } else if (epoxyColorQuartzSystem.capCoat is PUCoat) {
                PUCoatSuite(puCoat: epoxyColorQuartzSystem.capCoat as! PUCoat)
            }
            
            if (epoxyColorQuartzSystem.topCoat is TSCoat) {
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.topCoat as! TSCoat)
            } else if (epoxyColorQuartzSystem.topCoat is PACoat) {
                PACoatSuite(paCoat: epoxyColorQuartzSystem.topCoat as! PACoat)
            } else if (epoxyColorQuartzSystem.topCoat is PUCoat) {
                PUCoatSuite(puCoat: epoxyColorQuartzSystem.topCoat as! PUCoat)
            }
            
            if (epoxyColorQuartzSystem.primeCoat != nil) {
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.primeCoat!)
            }
            
            if (epoxyColorQuartzSystem.mvrCoat != nil) {
                TSCoatSuite(tsCoat: epoxyColorQuartzSystem.mvrCoat!)
            }
            
            EpoxyColorQuartzBuildSubmitButton(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
            
        }
        .navigationTitle("Coat Options")
    }
}

struct EpoxyColorQuartzCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyColorQuartzSystem()
        
        EpoxyColorQuartzCoatEditorView(epoxyColorQuartzSystem: mockSystem)
    }
}
