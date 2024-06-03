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
    
    @Binding var showEditors: Bool

    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    VStack {
                        // Display System Description
                        Text("Modify the System to your needs, and proceed to specify your Coat Options.")
                            .font(.subheadline)
                        // Display System Image
                        Image(currentBuild.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        // Display System Name
                        Text(currentBuild.name)
                            .font(.headline)
                        
                        SqftForm(system: currentBuild)
                        
                        if let upcSystem = currentBuild as? UPCSystem {
                            UPCSystemSuite(upcSystem: upcSystem)
                        }
                        
                        if let colorChipSystem = currentBuild as? ColorChipSystem {
                            ColorChipSystemSuite(colorChipSystem: colorChipSystem)
                        }
                        
                        if let colorSplashSystem = currentBuild as? ColorSplashSystem {
                            ColorSplashSystemSuite(colorSplashSystem: colorSplashSystem)
                        }
                        
                        if let epoxyMVRSystem = currentBuild as? EpoxyMVRSystem {
                            EpoxyMVRSystemSuite(epoxyMVRSystem: epoxyMVRSystem)
                        }
                        
                        if let epoxyCoveSystem = currentBuild as? EpoxyCoveSystem {
                            EpoxyCoveSystemSuite(epoxyCoveSystem: epoxyCoveSystem)
                        }
                        
                        if let upcCoveSystem = currentBuild as? UPCCoveSystem {
                            UPCCoveSystemSuite(upcCoveSystem: upcCoveSystem)
                        }
                        
                        if let upcColorQuartzSystem = currentBuild as? UPCColorQuartzSystem {
                            UPCColorQuartzSystemSuite(upcColorQuartzSystem: upcColorQuartzSystem)
                        }
                        
                    }
                    .padding(.all)
                    .navigationTitle("System Options")
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(currentBuild.name) Calculator")
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            showEditors = false
                        }
                    }
                }
            }
        }
    }
}


struct SystemBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = System.getTestSystem()

        // Pass the mock System instance into SystemBuilderView
        SystemBuilderView(currentBuild: mockSystem, showEditors: .constant(true))
    }
}

