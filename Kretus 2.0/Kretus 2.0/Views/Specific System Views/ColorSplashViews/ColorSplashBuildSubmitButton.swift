//
//  ColorSplashBuildSubmitButton.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/29/24.
//

import Foundation
import SwiftUI

struct ColorSplashBuildSubmitButton: View {
    
    @ObservedObject var colorSplashSystem: ColorSplashSystem
    
    @State private var showSheet = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        NavigationLink(destination: ColorSplashBuildSuite(colorSplashSystem: colorSplashSystem)
            .onAppear {
                colorSplashSystem.getAllKits()
            }) {
                HStack {
                  Text("View System Calculation")
                    .font(.title)
                    .padding()
                  
                  Spacer()
                    
                  Image(systemName: "chevron.right")
                        .padding()
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}





struct ColorSplashBuildSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorSplashSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorSplashBuildSubmitButton(colorSplashSystem: mockSystem)
    }
}
