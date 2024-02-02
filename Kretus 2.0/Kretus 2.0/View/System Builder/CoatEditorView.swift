//
//  CoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct CoatEditorView: View {
    
    let userCoat: Coat
    
    var body: some View {
        
        switch userCoat.coatType {
        case .base:
            Text("Base Coat")
        case .prime:
            Text("Prime Coat")
        case .top:
            Text("Top Coat")
        }
    }
}

struct CoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = UPCCoat()

        // Pass the mock System instance into SystemBuilderView
        CoatEditorView(userCoat: mockCoat)
    }
}
