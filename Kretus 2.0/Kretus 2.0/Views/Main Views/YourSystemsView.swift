//
//  YourSystemsView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/31/24.
//

import SwiftUI
import SwiftData

struct YourSystemsView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                SystemListView()
            }
            .navigationTitle("Your Systems")
        }
    }
}

#Preview {
    YourSystemsView()
}
