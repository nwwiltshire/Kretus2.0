//
//  UPCIndustrialSandCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct UPCIndustrialSandCoatEditorView: View {
 
    @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem

    var body: some View {
        ScrollView {
            
            if (upcIndustrialSandSystem.baseCoat != nil) {
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.baseCoat!)
                IndustrialSandBroadcastPicker(industrialSandBroadcast: upcIndustrialSandSystem.broadcast!)
            }
            
            if (upcIndustrialSandSystem.baseCoat1 != nil) {
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.baseCoat1!)
                IndustrialSandBroadcastPicker(industrialSandBroadcast: upcIndustrialSandSystem.broadcast1!)
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.baseCoat2!)
                IndustrialSandBroadcastPicker(industrialSandBroadcast: upcIndustrialSandSystem.broadcast2!)
            }
            
            if (upcIndustrialSandSystem.capCoat is TSCoat) {
                TSCoatSuite(tsCoat: upcIndustrialSandSystem.capCoat as! TSCoat)
            } else if (upcIndustrialSandSystem.capCoat is PACoat) {
                PACoatSuite(paCoat: upcIndustrialSandSystem.capCoat as! PACoat)
            } else if (upcIndustrialSandSystem.capCoat is PUCoat) {
                PUCoatSuite(puCoat: upcIndustrialSandSystem.capCoat as! PUCoat)
            } else if (upcIndustrialSandSystem.capCoat is UPCCoat) {
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.capCoat as! UPCCoat)
            }
            
            if (upcIndustrialSandSystem.topCoat is TSCoat) {
                TSCoatSuite(tsCoat: upcIndustrialSandSystem.topCoat as! TSCoat)
            } else if (upcIndustrialSandSystem.topCoat is PACoat) {
                PACoatSuite(paCoat: upcIndustrialSandSystem.topCoat as! PACoat)
            } else if (upcIndustrialSandSystem.topCoat is PUCoat) {
                PUCoatSuite(puCoat: upcIndustrialSandSystem.topCoat as! PUCoat)
            } else if (upcIndustrialSandSystem.topCoat is UPCCoat) {
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.topCoat as! UPCCoat)
            }
            
            if (upcIndustrialSandSystem.primeCoat != nil) {
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.primeCoat!)
            }
            
            if (upcIndustrialSandSystem.mvrCoat != nil) {
                UPCUniversalCoatSuite(upcCoat: upcIndustrialSandSystem.mvrCoat!)
            }
            
            UPCIndustrialSandBuildSubmitButton(upcIndustrialSandSystem: upcIndustrialSandSystem)
            
        }
        .navigationTitle("Coat Options")
    }
    
}

struct UPCIndustrialSandCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCIndustrialSandSystem()

        UPCIndustrialSandCoatEditorView(upcIndustrialSandSystem: mockSystem)
    }
}
