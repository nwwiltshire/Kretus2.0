//
//  CoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct CoatEditorView: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        
        VStack {
            if (system.hasBaseCoat) {
                Text("Base Coat")
            }
            
            if (system.hasPrimeCoat) {
                Text("Prime Coat")
            }
            
            if (system.hasTopCoat) {
                Text("Top Coat")
            }
        }
        
        
        /*
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(system.viewColor).opacity(0.25))
         */
    }
}

struct CoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = System.getTestSystem()

        // Pass the mock System instance into SystemBuilderView
        CoatEditorView(system: mockSystem)
    }
}
