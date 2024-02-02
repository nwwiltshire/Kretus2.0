//
//  SubSystemView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct SubSystemView: View {
    
    // System user will build and summary will be derived from
    let systemBuild: System
    
    var body: some View {
        
        Text("Test")
        Form {
            Section {
                
            }
        }
        
    }
}

struct SubSystemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem(id: 0,
                                name: "UPC 1-Coat",
                                description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
                                imageName: "default",
                                viewColor: "UPC",
                                subType: .rc,
                                baseCoat: UPCCoat(),
                                primeCoat: UPCCoat(),
                                topCoat: UPCCoat(),
                                squareFt: 0,
                                totalkitsNeeded: [])

        // Pass the mock System instance into SystemBuilderView
        SubSystemView(systemBuild: mockSystem)
    }
}

