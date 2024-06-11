//
//  ESDCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ESDCoatEditorView: View {
    
    @ObservedObject var esdSystem: ESDSystem
    
    var body: some View {
        
        ScrollView {
            TSCoatSuite(tsCoat: esdSystem.mvrCoat)
            
            if (esdSystem.conductivePrimer != nil) {
                ConductivePrimerCoatSuite(conductivePrimer: esdSystem.conductivePrimer!)
            }
            
            PACoatSuite(paCoat: esdSystem.topCoat)
            
            ESDBuildSubmitButton(esdSystem: esdSystem)
            
        }
        .navigationTitle("Coat Options")
    }
    
}
struct ESDCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ESDSystem()
        
        ESDCoatEditorView(esdSystem: mockSystem)
    }
}
