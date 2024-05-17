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
    
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: SystemData.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(modelContainer)
    }
    
}
