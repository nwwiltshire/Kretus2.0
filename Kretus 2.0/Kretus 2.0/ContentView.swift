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
            SystemGridView()
                .tabItem() {
                    Image(systemName: "plusminus.circle.fill")
                    Text("Calculator")
                }
            YourSystemsView()
                .tabItem() {
                    Image(systemName: "folder")
                    Text("Your Systems")
                }
            SelectLineView()
                .tabItem() {
                    Image(systemName: "shippingbox")
                    Text("Select Line")
                }
            InformationView()
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
