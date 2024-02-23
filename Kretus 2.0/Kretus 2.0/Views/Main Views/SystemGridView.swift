//
//  SystemSelector.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/20/24.
//

import SwiftUI

struct SystemGridView: View {
    
    let systems = System.getAllSystems()
    
    let layout = [
        
            GridItem(.flexible()),
            GridItem(.flexible())
            
        ]
    
    
    var body: some View {
        
        NavigationView {
            
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
                    LazyVGrid(columns: layout, spacing: 20) {
                        
                        // Populates Grid
                        ForEach(systems, id: \.id) { system in
                            NavigationLink(destination: SystemBuilderView(currentBuild: system)) {
                                
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
                                        .foregroundColor(.secondary)
                                        .colorInvert()
                                    
                                    
                                }
                                .padding(.all)
                                .background(Color(system.viewColor))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                                
                            }
                        }
                    }
                    .padding(.all)
                    
                }
                .navigationTitle("System Builder")
            }
        }
    }
}

#Preview {
    SystemGridView()
}
