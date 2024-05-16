//
//  Kretus_2_0App.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import SwiftUI
import SwiftData

@main
struct Kretus_2_0App: App {
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(for: SystemData.self)
    }
    
}
