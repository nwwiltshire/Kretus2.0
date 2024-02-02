//
//  SystemBuilderView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct SystemBuilderView: View {
    
    // System user will build and summary will be derived from
    @ObservedObject var systemBuild: System

    var body: some View {
        ScrollView {
            VStack {
                // Display System Image
                Image(systemBuild.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                // Display System Description
                Text(systemBuild.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.all)
            .navigationTitle(systemBuild.name)
        }
    }
}


struct SystemBuilderView_Previews: PreviewProvider {
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
        SystemBuilderView(systemBuild: mockSystem)
    }
}

