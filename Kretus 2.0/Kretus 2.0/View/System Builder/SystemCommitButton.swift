//
//  SystemCommitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/15/24.
//

import Foundation
import SwiftUI

struct SystemCommitButton: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        NavigationLink(destination: CoatEditorView(system: system)) {
            HStack {
                Text("Coat Options")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
        
}





struct SystemCommitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = System.getTestSystem()

        // Pass the mock System instance into SystemBuilderView
        SystemCommitButton(system: mockSystem)
    }
}
