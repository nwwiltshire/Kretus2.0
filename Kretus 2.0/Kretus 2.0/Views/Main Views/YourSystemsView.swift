//
//  YourSystemsView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI
import SwiftData

struct YourSystemsView: View {
    
    @Query private var systems: [SystemData]
    
    var body: some View {
        if !systems.isEmpty {
                ForEach(systems) { system in
                    Text(system.nameFromUser)
                }
            } else {
                Text("No Systems yet.")
            }
    }
}

#Preview {
    YourSystemsView()
}
