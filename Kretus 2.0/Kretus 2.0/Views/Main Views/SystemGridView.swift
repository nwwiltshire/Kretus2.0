//
//  SystemSelector.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/20/24.
//

import SwiftUI

struct SystemGridView: View {
    
    let systems: [System] = System.getAllSystems()
    
    @State public var showEditors = false
    @State private var selectedSystem: System?
    
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
        
                VStack {
                    
                    HStack {
                        Text("Select a System to begin.")
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                            .padding()
                        
                        Spacer()
                    }
                    
                    // Grid of Systems
                    VStack {
                        
                        // Populates Grid
                        ForEach(systems, id: \.id) { system in
                            Button(action: {
                                showEditors = true
                                selectedSystem = system
                            }) {
                                
                                // Grid Elements
                                VStack {
                                    
                                    // Display System name
                                    Text(system.name)
                                        .font(.title)
                                        .foregroundColor(.primary)
                                        .colorInvert()
                                    
                                    
                                    // Display System Description
                                    Text(system.description)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .colorInvert()
                                    
                                    
                                }
                                .frame(width: 300)
                                .padding()
                                .background(Color(system.viewColor))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                                
                            }
                            .sheet(isPresented: $showEditors) {
                                if let selectedSystem = selectedSystem {
                                    SystemBuilderView(currentBuild: selectedSystem, showEditors: $showEditors)
                                }
                            }
                            .animation(.default, value: showEditors)
                        }
                }
                    .navigationTitle("System Calculator")
                }
            }
            .padding()
        }
    }
}

#Preview {
    SystemGridView()
}
