//
//  ContentView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            SystemGridView()
                .tabItem() {
                    Image(systemName: "hammer")
                    Text("System Builder")
                }
            SelectLineView()
                .tabItem() {
                    Image(systemName: "shippingbox")
                    Text("Select Line")
                }
            YourSystemsView()
                .tabItem() {
                    Image(systemName: "folder")
                    Text("Your Systems")
                }
            DocumentationView()
                .tabItem() {
                    Image(systemName: "magazine")
                    Text("Info")
                }
        }
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
