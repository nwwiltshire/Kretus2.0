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
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                // Display System Name
                Text(systemBuild.name)
                    .font(.headline)
                
                // Display System Description
                Text(systemBuild.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                SqftForm(system: systemBuild)
                
                HasCoatPicker(system: systemBuild)
                
                SubSystemPicker(system: systemBuild)
                
                ColorPicker(system: systemBuild)
                
                SystemCommitButton(system: systemBuild)
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
        SystemBuilderView(systemBuild: mockSystem)
    }
}

