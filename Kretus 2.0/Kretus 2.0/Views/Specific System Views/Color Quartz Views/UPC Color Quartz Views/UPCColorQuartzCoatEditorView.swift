//
//  UPCColorQuartzCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct UPCColorQuartzCoatEditorView: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    var body: some View {
        ScrollView {
            UPCUniversalCoatSuite(upcCoat: upcColorQuartzSystem.baseCoat)
            ColorChipBroadcastPicker(colorChipBroadcast: upcColorQuartzSystem.broadcast)
            
            if (upcColorQuartzSystem.capCoat is TSCoat) {
                TSCoatSuite(tsCoat: upcColorQuartzSystem.capCoat as! TSCoat)
            } else if (upcColorQuartzSystem.capCoat is PACoat) {
                PACoatSuite(paCoat: upcColorQuartzSystem.capCoat as! PACoat)
            } else if (upcColorQuartzSystem.capCoat is PUCoat) {
                PUCoatSuite(puCoat: upcColorQuartzSystem.capCoat as! PUCoat)
            }
            
            if (upcColorQuartzSystem.topCoat is TSCoat) {
                TSCoatSuite(tsCoat: upcColorQuartzSystem.topCoat as! TSCoat)
            } else if (upcColorQuartzSystem.topCoat is PACoat) {
                PACoatSuite(paCoat: upcColorQuartzSystem.topCoat as! PACoat)
            } else if (upcColorQuartzSystem.topCoat is PUCoat) {
                PUCoatSuite(puCoat: upcColorQuartzSystem.topCoat as! PUCoat)
            }
            
            if (upcColorQuartzSystem.primeCoat != nil) {
                UPCUniversalCoatSuite(upcCoat: upcColorQuartzSystem.primeCoat!)
            }
            
            if (upcColorQuartzSystem.mvrCoat != nil) {
                UPCUniversalCoatSuite(upcCoat: upcColorQuartzSystem.mvrCoat!)
            }
            
            UPCColorQuartzBuildSubmitButton(upcColorQuartzSystem: upcColorQuartzSystem)
            
        }
        .navigationTitle("Coat Options")
    }
}

struct UPCColorQuartzCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCColorQuartzSystem()
        
        UPCColorQuartzCoatEditorView(upcColorQuartzSystem: mockSystem)
    }
}
