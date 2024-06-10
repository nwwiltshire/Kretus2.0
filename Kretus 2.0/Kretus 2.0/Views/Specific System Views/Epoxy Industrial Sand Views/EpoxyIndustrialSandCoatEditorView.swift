//
//  EpoxyIndustrialSandCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct EpoxyIndustrialSandCoatEditorView: View {
 
    @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem

    var body: some View {
        ScrollView {
            
            if (epoxyIndustrialSandSystem.baseCoat != nil) {
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.baseCoat!)
                IndustrialSandBroadcastPicker(industrialSandBroadcast: epoxyIndustrialSandSystem.broadcast!)
            }
            
            if (epoxyIndustrialSandSystem.baseCoat1 != nil) {
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.baseCoat1!)
                IndustrialSandBroadcastPicker(industrialSandBroadcast: epoxyIndustrialSandSystem.broadcast1!)
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.baseCoat2!)
                IndustrialSandBroadcastPicker(industrialSandBroadcast: epoxyIndustrialSandSystem.broadcast2!)
            }
            
            if (epoxyIndustrialSandSystem.capCoat is TSCoat) {
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.capCoat as! TSCoat)
            } else if (epoxyIndustrialSandSystem.capCoat is PACoat) {
                PACoatSuite(paCoat: epoxyIndustrialSandSystem.capCoat as! PACoat)
            } else if (epoxyIndustrialSandSystem.capCoat is PUCoat) {
                PUCoatSuite(puCoat: epoxyIndustrialSandSystem.capCoat as! PUCoat)
            } else if (epoxyIndustrialSandSystem.capCoat is UPCCoat) {
                UPCUniversalCoatSuite(upcCoat: epoxyIndustrialSandSystem.capCoat as! UPCCoat)
            }
            
            if (epoxyIndustrialSandSystem.topCoat is TSCoat) {
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.topCoat as! TSCoat)
            } else if (epoxyIndustrialSandSystem.topCoat is PACoat) {
                PACoatSuite(paCoat: epoxyIndustrialSandSystem.topCoat as! PACoat)
            } else if (epoxyIndustrialSandSystem.topCoat is PUCoat) {
                PUCoatSuite(puCoat: epoxyIndustrialSandSystem.topCoat as! PUCoat)
            } else if (epoxyIndustrialSandSystem.topCoat is UPCCoat) {
                UPCUniversalCoatSuite(upcCoat: epoxyIndustrialSandSystem.topCoat as! UPCCoat)
            }
            
            if (epoxyIndustrialSandSystem.primeCoat != nil) {
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.primeCoat!)
            }
            
            if (epoxyIndustrialSandSystem.mvrCoat != nil) {
                TSCoatSuite(tsCoat: epoxyIndustrialSandSystem.mvrCoat!)
            }
            
            EpoxyIndustrialSandBuildSubmitButton(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
            
        }
        .navigationTitle("Coat Options")
    }
    
}

struct EpoxyIndustrialSandCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyIndustrialSandSystem()

        EpoxyIndustrialSandCoatEditorView(epoxyIndustrialSandSystem: mockSystem)
    }
}
