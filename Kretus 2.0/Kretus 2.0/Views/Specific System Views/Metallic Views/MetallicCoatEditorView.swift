//
//  MetallicCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

struct MetallicCoatEditorView: View {
    
    @ObservedObject var metallicSystem: MetallicSystem
    
    var body: some View {
        
        ScrollView {
            if (metallicSystem.metallicBaseCoat != nil) {
                TSCoatSuite(tsCoat: metallicSystem.metallicBaseCoat!)
                TSCoatSuite(tsCoat: metallicSystem.metallicAccentCoat!)
            }
            
            if (metallicSystem.metallicBodyCoat != nil) {
                PUCoatSuite(puCoat: metallicSystem.metallicBodyCoat!)
            }
            
            TSCoatSuite(tsCoat: metallicSystem.primeCoat)
            
            if (metallicSystem.topCoat is TSCoat) {
                TSCoatSuite(tsCoat: metallicSystem.topCoat as! TSCoat)
            } else if (metallicSystem.topCoat is PACoat) {
                PACoatSuite(paCoat: metallicSystem.topCoat as! PACoat)
            } else if (metallicSystem.topCoat is PUCoat) {
                PUCoatSuite(puCoat: metallicSystem.topCoat as! PUCoat)
            }
            
            MetallicBuildSubmitButton(metallicSystem: metallicSystem)
            
        }
        .padding()
        .navigationTitle("Coat Options")
        
    }
    
}
struct MetallicCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = MetallicSystem()
        
        MetallicCoatEditorView(metallicSystem: mockSystem)
    }
}
