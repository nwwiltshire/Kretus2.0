//
//  SystemBuilderView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI

struct SystemBuilderView: View {
    
    // System user will build and summary will be derived from
    @ObservedObject var currentBuild: System

    var body: some View {
        ScrollView {
            VStack {
                // Display System Image
                Image(currentBuild.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                // Display System Name
                Text(currentBuild.name)
                    .font(.headline)
                
                // Display System Description
                Text("Modify the System to your needs, and proceed to specify your Coat Options.")
                    .font(.subheadline)
                
                SqftForm(system: currentBuild)
                
                if let upcSystem = currentBuild as? UPCSystem {
                    UPCSystemSuite(upcSystem: upcSystem)
                }
                
            }
            .padding(.all)
            .navigationTitle("System Options")
        }
    }
}


struct SystemBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = System.getTestSystem()

        // Pass the mock System instance into SystemBuilderView
        SystemBuilderView(currentBuild: mockSystem)
    }
}

