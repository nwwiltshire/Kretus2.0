//
//  ESDBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ESDBuildSubmitButton: View {
    
    @ObservedObject var esdSystem: ESDSystem
    
    var body: some View {
        NavigationLink(destination: ESDBuildSuite(esdSystem: esdSystem)
            .onAppear {
                esdSystem.getAllKits()
            }) {
                HStack {
                  Text("View System Calculation")
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
struct ESDBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ESDSystem()
        
        ESDBuildSubmitButton(esdSystem: mockSystem)
    }
}
