//
//  SqftForm.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/6/24.
//

import Foundation
import SwiftUI

struct SqftForm: View {
    
    @ObservedObject var system: System
    
    @State private var selectedSquareFt: Int = 50 {
        didSet {
            system.squareFt = selectedSquareFt
        }
    }
    
    var body: some View {
        VStack {
            
                    Text("Total Square Feet:")
                        .font(.headline)
                        .padding()
            
                    TextField("Enter Square Feet", value: $selectedSquareFt, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.white).opacity(0.25))
                        )
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(system.viewColor).opacity(0.25))
                )
    }
}





struct SqftForm_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = System.getTestSystem()

        // Pass the mock System instance into SystemBuilderView
        SqftForm(system: mockSystem)
    }
}
